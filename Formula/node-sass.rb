class NodeSass < Formula
  require "language/node"

  desc "JavaScript implementation of a Sass compiler"
  homepage "https://github.com/sass/dart-sass"
  url "https://registry.npmjs.org/sass/-/sass-1.58.2.tgz"
  sha256 "a57366f8084fa4b41109ead6f3ede273d79b1627d4b4f676feca3a210aa27b78"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "898af54a06862325c1c6b53486f44f6a86fe20a40999bc924edb15f0324ac919"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "898af54a06862325c1c6b53486f44f6a86fe20a40999bc924edb15f0324ac919"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "898af54a06862325c1c6b53486f44f6a86fe20a40999bc924edb15f0324ac919"
    sha256 cellar: :any_skip_relocation, ventura:        "898af54a06862325c1c6b53486f44f6a86fe20a40999bc924edb15f0324ac919"
    sha256 cellar: :any_skip_relocation, monterey:       "898af54a06862325c1c6b53486f44f6a86fe20a40999bc924edb15f0324ac919"
    sha256 cellar: :any_skip_relocation, big_sur:        "898af54a06862325c1c6b53486f44f6a86fe20a40999bc924edb15f0324ac919"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "0c234023d18782ab5532defb853cbf3e8cf75883d8d0cf3975983c51ff68d020"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"test.scss").write <<~EOS
      div {
        img {
          border: 0px;
        }
      }
    EOS

    assert_equal "div img{border:0px}",
    shell_output("#{bin}/sass --style=compressed test.scss").strip
  end
end
