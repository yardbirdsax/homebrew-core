class Pyside < Formula
  include Language::Python::Virtualenv

  desc "Official Python bindings for Qt"
  homepage "https://wiki.qt.io/Qt_for_Python"
  url "https://download.qt.io/official_releases/QtForPython/pyside6/PySide6-6.3.1-src/pyside-setup-opensource-src-6.3.1.tar.xz"
  sha256 "e5a85ed68834eb8324e3486283a9451b030d7221809e2a9533162e6b93899977"
  license all_of: ["GFDL-1.3-only", "GPL-2.0-only", "GPL-3.0-only", "LGPL-3.0-only"]

  livecheck do
    url "https://download.qt.io/official_releases/QtForPython/pyside6/"
    regex(%r{href=.*?PySide6[._-]v?(\d+(?:\.\d+)+)-src/}i)
  end

  bottle do
    rebuild 1
    sha256 cellar: :any,                 arm64_monterey: "455bbdafca9894d0d494e120a1f8b2d2dbe64af642d87821e66586f81f9f3060"
    sha256 cellar: :any,                 arm64_big_sur:  "bebe4341db03f9b611e823636d61be229d955047ab4733c1cabe340182790576"
    sha256 cellar: :any,                 monterey:       "83b7b49c598da90d11904fd4d6c0dece96bbb756b3b64aa29877238fdc494b40"
    sha256 cellar: :any,                 big_sur:        "48d1b20de4529f0c28725025a70cd383ffe1e74f6e858895d5ac08681bd860d9"
    sha256 cellar: :any,                 catalina:       "c13ae17ed807225ffea52e61cdef9a326771b9a98f77da38a60bf93996087aae"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "3939c1f8d28c54b9a6de4abe000816ac598c83dfd0074f684d3a1d18e4bc34ca"
  end

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on xcode: :build
  depends_on "llvm"
  depends_on "python@3.10"
  depends_on "qt"

  uses_from_macos "libxml2"
  uses_from_macos "libxslt"

  on_linux do
    depends_on "mesa"
  end

  fails_with gcc: "5"

  def python3
    "python3.10"
  end

  def install
    ENV.append_path "PYTHONPATH", buildpath/"build/sources"

    extra_include_dirs = [Formula["qt"].opt_include]
    extra_include_dirs << Formula["mesa"].opt_include if OS.linux?

    # upstream issue: https://bugreports.qt.io/browse/PYSIDE-1684
    inreplace "sources/pyside6/cmake/Macros/PySideModules.cmake",
              "${shiboken_include_dirs}",
              "${shiboken_include_dirs}:#{extra_include_dirs.join(":")}"

    # Fix build failure on macOS because `CMAKE_BINARY_DIR` points to /tmp but
    # `location` points to `/private/tmp`, which makes this conditional fail.
    # Submitted upstream here: https://codereview.qt-project.org/c/pyside/pyside-setup/+/416706.
    inreplace "sources/pyside6/PySide6/__init__.py.in",
              "in_build = Path(\"@CMAKE_BINARY_DIR@\") in location.parents",
              "in_build = Path(\"@CMAKE_BINARY_DIR@\").resolve() in location.parents"

    args = std_cmake_args + [
      "-DCMAKE_PREFIX_PATH=#{Formula["qt"].opt_lib}",
      "-DPYTHON_EXECUTABLE=#{which(python3)}",
      "-DBUILD_TESTS=OFF",
      "-DNO_QT_TOOLS=yes",
      "-DCMAKE_INSTALL_RPATH=#{lib}",
      "-DFORCE_LIMITED_API=yes",
    ]

    system "cmake", "-S", ".", "-B", "build", *args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    mv bin/"metaobjectdump.py", pkgshare
    mv bin/"project.py", pkgshare
  end

  test do
    system python3, "-c", "import PySide6"
    system python3, "-c", "import shiboken6"

    modules = %w[
      Core
      Gui
      Network
      Positioning
      Quick
      Svg
      Widgets
      Xml
    ]

    modules << "WebEngineCore" if OS.linux? || (DevelopmentTools.clang_build_version > 1200)

    modules.each { |mod| system python3, "-c", "import PySide6.Qt#{mod}" }

    python3_config = Formula["python@3.10"].opt_bin/"#{python3}-config"
    pyincludes = shell_output("#{python3_config} --includes").chomp.split
    pylib = shell_output("#{python3_config} --ldflags --embed").chomp.split
    if OS.linux?
      pylib += %W[
        -Wl,-rpath,#{Formula["python@3.10"].opt_lib}
        -Wl,-rpath,#{lib}
      ]
    end

    (testpath/"test.cpp").write <<~EOS
      #include <shiboken.h>
      int main()
      {
        Py_Initialize();
        Shiboken::AutoDecRef module(Shiboken::Module::import("shiboken6"));
        assert(!module.isNull());
        return 0;
      }
    EOS
    system ENV.cxx, "-std=c++17", "test.cpp",
           "-I#{include}/shiboken6",
           "-L#{lib}", "-lshiboken6.abi3",
           *pyincludes, *pylib, "-o", "test"
    system "./test"
  end
end
