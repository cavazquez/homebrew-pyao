class PyaoServer < Formula
  desc "Servidor de Argentum Online con Python privado; Redis es externo"
  homepage "https://github.com/cavazquez/pyao-server"
  version "1.0.0rc5"
  license "Apache-2.0"
  depends_on :macos
  on_arm do
    url "https://github.com/cavazquez/homebrew-pyao/releases/download/v1.0.0rc5/pyao-server-1.0.0rc5-macos-arm64.zip"
    sha256 "5a1b4cf3ba0561ef05f8e7d21c12145e591f73e02c42935f71beecdcd4b178b8"
  end
  on_intel do
    url "https://github.com/cavazquez/homebrew-pyao/releases/download/v1.0.0rc5/pyao-server-1.0.0rc5-macos-amd64.zip"
    sha256 "db2d4c170546bf229c8ce5b3d7d2c3209fb04f8b57b33b1cba05206cb0e0aa98"
  end
  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"pyao-server"
    bin.write_exec_script libexec/"pyao-server-indicator"
  end
  def caveats
    "Redis es externo; instalarlo y configurarlo por separado. El paquete no inicia Redis."
  end
  test do
    ENV["PYAO_STATE_DIR"] = testpath/"state"
    assert_match version.to_s, shell_output("#{bin}/pyao-server --version")
    system bin/"pyao-server", "--check-resources"
  end
end
