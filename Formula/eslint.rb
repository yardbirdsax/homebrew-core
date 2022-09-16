require "language/node"

class Eslint < Formula
  desc "AST-based pattern checker for JavaScript"
  homepage "https://eslint.org"
  url "https://registry.npmjs.org/eslint/-/eslint-8.23.1.tgz"
  sha256 "7903900189ed46fea49d079c1c3247eff6822d93d61730cd118833fd7c8b5a86"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "c1b3b29054630db83934a3dd1654a782a2f68debc619b3bc6bf4aeea7bf31cc5"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "c1b3b29054630db83934a3dd1654a782a2f68debc619b3bc6bf4aeea7bf31cc5"
    sha256 cellar: :any_skip_relocation, monterey:       "26711e3cddd519c86c89ec9c812eb81685a1021e4f678f0571d658473acdf317"
    sha256 cellar: :any_skip_relocation, big_sur:        "26711e3cddd519c86c89ec9c812eb81685a1021e4f678f0571d658473acdf317"
    sha256 cellar: :any_skip_relocation, catalina:       "26711e3cddd519c86c89ec9c812eb81685a1021e4f678f0571d658473acdf317"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c1b3b29054630db83934a3dd1654a782a2f68debc619b3bc6bf4aeea7bf31cc5"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/".eslintrc.json").write("{}") # minimal config
    (testpath/"syntax-error.js").write("{}}")
    # https://eslint.org/docs/user-guide/command-line-interface#exit-codes
    output = shell_output("#{bin}/eslint syntax-error.js", 1)
    assert_match "Unexpected token }", output
  end
end
