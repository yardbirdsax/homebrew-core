class Esphome < Formula
  include Language::Python::Virtualenv

  desc "Make creating custom firmwares for ESP32/ESP8266 super easy"
  homepage "https://github.com/esphome/esphome"
  url "https://files.pythonhosted.org/packages/3c/d6/4b3304c609eee814064db2d0f2e6565301f05b98a6798c3fa301b108f0fa/esphome-2022.8.3.tar.gz"
  sha256 "d0322aa7cda1a71fdaf784b2f35271d0da7d9faeafdcc8aa7cf51868ea6105b4"
  license "MIT"

  bottle do
    sha256 cellar: :any,                 arm64_monterey: "c31854011ac5b5b182657685bc4de3cd172e7b24415e97614b94e591ea6c75df"
    sha256 cellar: :any,                 arm64_big_sur:  "99f29a744e19d17939a0caa7237f17e0354e5990fbba470fead92c58dfa285a8"
    sha256 cellar: :any,                 monterey:       "d4eae7b6e3024f695b5b6ec7c480491432bc4a8c01b3e8910f5bee63098d56d8"
    sha256 cellar: :any,                 big_sur:        "f3aceab5bd8b54934c1b77f70c97b43d1fa4385fcf808d2f2b272e1fb8788533"
    sha256 cellar: :any,                 catalina:       "ad2ef4133fea70490b7ad1baa539db6f000cc101db1555b70583f2735a072cbf"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "404859e1b241005c332f999d13dd4aecd1ef743a7b5a3fd5ba7b9019b2a903c0"
  end

  depends_on "rust" => :build # for cryptography
  depends_on "libpython-tabulate"
  depends_on "protobuf"
  depends_on "python@3.10"
  depends_on "six"

  resource "aioesphomeapi" do
    url "https://files.pythonhosted.org/packages/cc/84/e3308c936ba2d4ff8048aa589eb5eaeb68322077f79fffb0aac90d2cbf48/aioesphomeapi-10.11.0.tar.gz"
    sha256 "2a2479cc2f086a22a048cd9657de1af30b19c3f0d0716ef565281b8f4645abf0"
  end

  resource "aiofiles" do
    url "https://files.pythonhosted.org/packages/10/ca/c416cfacf6a47e1400dad56eab85aa86c92c6fbe58447d12035e434f0d5c/aiofiles-0.8.0.tar.gz"
    sha256 "8334f23235248a3b2e83b2c3a78a22674f39969b96397126cc93664d9a901e59"
  end

  resource "ajsonrpc" do
    url "https://files.pythonhosted.org/packages/da/5c/95a9b83195d37620028421e00d69d598aafaa181d3e55caec485468838e1/ajsonrpc-1.2.0.tar.gz"
    sha256 "791bac18f0bf0dee109194644f151cf8b7ff529c4b8d6239ac48104a3251a19f"
  end

  resource "anyio" do
    url "https://files.pythonhosted.org/packages/67/c4/fd50bbb2fb72532a4b778562e28ba581da15067cfb2537dbd3a2e64689c1/anyio-3.6.1.tar.gz"
    sha256 "413adf95f93886e442aea925f3ee43baa5a765a64a0f52c6081894f9992fdd0b"
  end

  resource "asgiref" do
    url "https://files.pythonhosted.org/packages/1f/35/e7d59b92ceffb1dc62c65156278de378670b46ab2364a3ea7216fe194ba3/asgiref-3.5.2.tar.gz"
    sha256 "4a29362a6acebe09bf1d6640db38c1dc3d9217c68e6f9f6204d72667fc19a424"
  end

  resource "async-timeout" do
    url "https://files.pythonhosted.org/packages/54/6e/9678f7b2993537452710ffb1750c62d2c26df438aa621ad5fa9d1507a43a/async-timeout-4.0.2.tar.gz"
    sha256 "2163e1640ddb52b7a8c80d0a67a08587e5d245cc9c553a74a847056bc2976b15"
  end

  resource "bitstring" do
    url "https://files.pythonhosted.org/packages/4c/b1/80d58eeb21c9d4ca739770558d61f6adacb13aa4908f4f55e0974cbd25ee/bitstring-3.1.9.tar.gz"
    sha256 "a5848a3f63111785224dca8bb4c0a75b62ecdef56a042c8d6be74b16f7e860e7"
  end

  resource "bottle" do
    url "https://files.pythonhosted.org/packages/7c/58/75f3765b0a3f86ef0b6e0b23d0503920936752ca6e0fc27efce7403b01bd/bottle-0.12.23.tar.gz"
    sha256 "683de3aa399fb26e87b274dbcf70b1a651385d459131716387abdc3792e04167"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/cc/85/319a8a684e8ac6d87a1193090e06b6bbb302717496380e225ee10487c888/certifi-2022.6.15.tar.gz"
    sha256 "84c85a9078b11105f04f3036a9482ae10e4621616db313fe045dd24743a0820d"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/2b/a8/050ab4f0c3d4c1b8aaa805f70e26e84d0e27004907c5b8ecc1d31815f92a/cffi-1.15.1.tar.gz"
    sha256 "d400bfb9a37b1351253cb402671cea7e89bdecc294e8016a707f6d1d8ac934f9"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/a1/34/44964211e5410b051e4b8d2869c470ae8a68ae274953b1c7de6d98bbcf94/charset-normalizer-2.1.1.tar.gz"
    sha256 "5a3d016c7c547f69d6f81fb0db9449ce888b418b5b9952cc5e6e66843e9dd845"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8/click-8.1.3.tar.gz"
    sha256 "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/2b/65/24d033a9325ce42ccbfa3ca2d0866c7e89cc68e5b9d92ecaba9feef631df/colorama-0.4.5.tar.gz"
    sha256 "e6c6b4334fc50988a639d9b98aa429a0b57da6e17b9a44f0451f930b6967b7a4"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/89/d9/5fcd312d5cce0b4d7ee8b551a0ea99e4ea9db0fdbf6dd455a19042e3370b/cryptography-37.0.4.tar.gz"
    sha256 "63f9c17c0e2474ccbebc9302ce2f07b55b3b3fcb211ded18a42d5764f5c10a82"
  end

  resource "ecdsa" do
    url "https://files.pythonhosted.org/packages/ff/7b/ba6547a76c468a0d22de93e89ae60d9561ec911f59532907e72b0d8bc0f1/ecdsa-0.18.0.tar.gz"
    sha256 "190348041559e21b22a1d65cee485282ca11a6f81d503fddb84d5017e9ed1e49"
  end

  resource "esphome-dashboard" do
    url "https://files.pythonhosted.org/packages/65/f1/30b614b431d454a90deba3d8c3b9f5119a5c24116451fa507feaf3980c8c/esphome-dashboard-20220508.0.tar.gz"
    sha256 "9c155535ee90c28ef6c2ce86f1600ef7d7f67ed6f1a22c4e0747a22ee20bc9e8"
  end

  resource "esptool" do
    url "https://files.pythonhosted.org/packages/de/57/08750ca0d19114237ff5e2da6a945deed888e3774c95acb577387ed11bec/esptool-3.3.1.tar.gz"
    sha256 "f9ade989a7f5f19bfc60e11925c45f470b8155c7ecf1a37bc8c31380d5dd07b8"
  end

  resource "h11" do
    url "https://files.pythonhosted.org/packages/fa/a6/450568b2d62dd633be53f69890332bb0ce78183ffbe1e514c2b3102efff5/h11-0.13.0.tar.gz"
    sha256 "70813c1135087a248a4d38cc0e1a0181ffab2188141a93eaf567940c3957ff06"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/62/08/e3fc7c8161090f742f504f40b1bccbfc544d4a4e09eb774bf40aafce5436/idna-3.3.tar.gz"
    sha256 "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
  end

  resource "ifaddr" do
    url "https://files.pythonhosted.org/packages/e8/ac/fb4c578f4a3256561548cd825646680edcadb9440f3f68add95ade1eb791/ifaddr-0.2.0.tar.gz"
    sha256 "cc0cbfcaabf765d44595825fb96a99bb12c79716b73b44330ea38ee2b0c4aed4"
  end

  resource "kconfiglib" do
    url "https://files.pythonhosted.org/packages/86/82/54537aeb187ade9b609af3d2988312350a7fab2ff2d3ec0230ae0410dc9e/kconfiglib-13.7.1.tar.gz"
    sha256 "a2ee8fb06102442c45965b0596944f02c2a1517f092fa208ca307f3fd12a0a22"
  end

  resource "marshmallow" do
    url "https://files.pythonhosted.org/packages/fa/12/f69c512928f2974f050cfb08c437b57b643586447ba0baaa99ef1fc44c7a/marshmallow-3.17.1.tar.gz"
    sha256 "48e2d88d4ab431ad5a17c25556d9da529ea6e966876f2a38d274082e270287f0"
  end

  resource "noiseprotocol" do
    url "https://files.pythonhosted.org/packages/76/17/fcf8a90dcf36fe00b475e395f34d92f42c41379c77b25a16066f63002f95/noiseprotocol-0.3.1.tar.gz"
    sha256 "b092a871b60f6a8f07f17950dc9f7098c8fe7d715b049bd4c24ee3752b90d645"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/df/9e/d1a7217f69310c1db8fdf8ab396229f55a699ce34a203691794c5d1cad0c/packaging-21.3.tar.gz"
    sha256 "dd47c42927d89ab911e606518907cc2d3a1f38bbd026385970643f9c5b8ecfeb"
  end

  resource "paho-mqtt" do
    url "https://files.pythonhosted.org/packages/f8/dd/4b75dcba025f8647bc9862ac17299e0d7d12d3beadbf026d8c8d74215c12/paho-mqtt-1.6.1.tar.gz"
    sha256 "2a8291c81623aec00372b5a85558a372c747cbca8e9934dfe218638b8eefc26f"
  end

  resource "platformio" do
    url "https://files.pythonhosted.org/packages/d2/9c/dc9d6373311ca5ab8c4fda3fc4c160473e730b4015dccf558acbf7e06c45/platformio-6.0.2.tar.gz"
    sha256 "e4cb9d45327d93b5888ba0c5d4c9ca22a30411952056e55b79d714c7f84f9b83"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/5e/0b/95d387f5f4433cb0f53ff7ad859bd2c6051051cebbb564f139a999ab46de/pycparser-2.21.tar.gz"
    sha256 "e644fdec12f7872f86c58ff790da456218b10f863970249516d60a5eaca77206"
  end

  resource "pyelftools" do
    url "https://files.pythonhosted.org/packages/0e/35/e76da824595452a5ad07f289ea1737ca0971fc6cc7b6ee9464279be06b5e/pyelftools-0.29.tar.gz"
    sha256 "ec761596aafa16e282a31de188737e5485552469ac63b60cfcccf22263fd24ff"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/71/22/207523d16464c40a0310d2d4d8926daffa00ac1f5b1576170a32db749636/pyparsing-3.0.9.tar.gz"
    sha256 "2b020ecf7d21b687f219b71ecad3631f644a47f01403fa1d1036b0c6416d70fb"
  end

  resource "pyserial" do
    url "https://files.pythonhosted.org/packages/1e/7d/ae3f0a63f41e4d2f6cb66a5b57197850f919f59e558159a4dd3a818f5082/pyserial-3.5.tar.gz"
    sha256 "3c77e014170dfffbd816e6ffc205e9842efb10be9f58ec16d3e8675b4925cddb"
  end

  resource "pytz-deprecation-shim" do
    url "https://files.pythonhosted.org/packages/94/f0/909f94fea74759654390a3e1a9e4e185b6cd9aa810e533e3586f39da3097/pytz_deprecation_shim-0.1.0.post0.tar.gz"
    sha256 "af097bae1b616dde5c5744441e2ddc69e74dfdcb0c263129610d85b87445a59d"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/36/2b/61d51a2c4f25ef062ae3f74576b01638bebad5e045f747ff12643df63844/PyYAML-6.0.tar.gz"
    sha256 "68fb519c14306fec9720a2a5b45bc9f0c8d1b9c72adf45c37baedfcd949c35a2"
  end

  resource "reedsolo" do
    url "https://files.pythonhosted.org/packages/c8/cb/bb2ddbd00c9b4215dd57a2abf7042b0ae222b44522c5eb664a8fd9d786da/reedsolo-1.5.4.tar.gz"
    sha256 "b8b25cdc83478ccb06361a0e8fadc27b376a3dfabbb1dc6bb583a998a22c0127"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/a5/61/a867851fd5ab77277495a8709ddda0861b28163c4613b011bc00228cc724/requests-2.28.1.tar.gz"
    sha256 "7c5599b102feddaa661c826c56ab4fee28bfd17f5abca1ebbe3e7f19d7c97983"
  end

  resource "semantic-version" do
    url "https://files.pythonhosted.org/packages/7d/31/f2289ce78b9b473d582568c234e104d2a342fd658cc288a7553d83bb8595/semantic_version-2.10.0.tar.gz"
    sha256 "bdabb6d336998cbb378d4b9db3a4b56a1e3235701dc05ea2690d9a997ed5041c"
  end

  resource "sniffio" do
    url "https://files.pythonhosted.org/packages/cd/50/d49c388cae4ec10e8109b1b833fd265511840706808576df3ada99ecb0ac/sniffio-1.3.0.tar.gz"
    sha256 "e60305c5e5d314f5389259b7f22aaa33d8f7dee49763119234af3755c55b9101"
  end

  resource "starlette" do
    url "https://files.pythonhosted.org/packages/b7/9b/dc9fa4c05a8aceb7abbf057b1279f0007ce8ab42c9b8f31a9c71981955bc/starlette-0.20.4.tar.gz"
    sha256 "42fcf3122f998fefce3e2c5ad7e5edbf0f02cf685d646a83a08d404726af5084"
  end

  resource "tornado" do
    url "https://files.pythonhosted.org/packages/cf/44/cc9590db23758ee7906d40cacff06c02a21c2a6166602e095a56cbf2f6f6/tornado-6.1.tar.gz"
    sha256 "33c6e81d7bd55b468d2e793517c909b139960b6c790a60b7991b9b6b76fb9791"
  end

  resource "tzdata" do
    url "https://files.pythonhosted.org/packages/3e/eb/a00286433c739bb1a0d83a069b2dc379a5d14b0b9c927e3cb00cb434d740/tzdata-2022.2.tar.gz"
    sha256 "21f4f0d7241572efa7f7a4fdabb052e61b55dc48274e6842697ccdf5253e5451"
  end

  resource "tzlocal" do
    url "https://files.pythonhosted.org/packages/7d/b9/164d5f510e0547ae92280d0ca4a90407a15625901afbb9f57a19d9acd9eb/tzlocal-4.2.tar.gz"
    sha256 "ee5842fa3a795f023514ac2d801c4a81d1743bbe642e3940143326b3a00addd7"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/b2/56/d87d6d3c4121c0bcec116919350ca05dc3afd2eeb7dc88d07e8083f8ea94/urllib3-1.26.12.tar.gz"
    sha256 "3fa96cf423e6987997fc326ae8df396db2a8b7c667747d47ddd8ecba91f4a74e"
  end

  resource "uvicorn" do
    url "https://files.pythonhosted.org/packages/6d/7d/b97c120cad5fd1f66462afb0d5ddd043078f2380b89fccd8a97ef5c95b5c/uvicorn-0.17.6.tar.gz"
    sha256 "5180f9d059611747d841a4a4c4ab675edf54c8489e97f96d0583ee90ac3bfc23"
  end

  resource "voluptuous" do
    url "https://files.pythonhosted.org/packages/72/0c/0ed7352eeb7bd3d53d2c0ae87fa1e222170f53815b8df7d9cdce7ffedec0/voluptuous-0.13.1.tar.gz"
    sha256 "e8d31c20601d6773cb14d4c0f42aee29c6821bbd1018039aac7ac5605b489723"
  end

  resource "wsproto" do
    url "https://files.pythonhosted.org/packages/f5/58/575e416cd024d23c52de9e17d02f4c5ef4a9c8a7258c6fc8f2b3f96f73cf/wsproto-1.1.0.tar.gz"
    sha256 "a2e56bfd5c7cd83c1369d83b5feccd6d37798b74872866e62616e0ecf111bda8"
  end

  resource "zeroconf" do
    url "https://files.pythonhosted.org/packages/2b/a5/0ad52f3dd265fd2538b882eb6682eaeee12d2ba4dd55a20ac65374bbf67d/zeroconf-0.39.0.tar.gz"
    sha256 "7c0d8257b940ee43e637fb560c2f9bd79da0638f37af162eb4f506f7274ef8e4"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    (testpath/"test.yaml").write <<~EOS
      esphome:
        name: test
        platform: ESP8266
        board: d1
    EOS

    assert_includes shell_output("#{bin}/esphome config #{testpath}/test.yaml 2>&1"), "INFO Configuration is valid!"
  end
end
