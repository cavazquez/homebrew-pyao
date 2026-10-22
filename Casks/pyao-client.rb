cask "pyao-client" do
  version "1.0.0rc5"
  name "PyAO Client"
  desc "Cliente de Argentum Online"
  homepage "https://github.com/cavazquez/ArgentumOnlineGodot"
  on_arm do
    url "https://github.com/cavazquez/ArgentumOnlineGodot/releases/download/v1.0.0rc5/pyao-client-1.0.0rc5-macos-arm64.zip"
    sha256 "25e24a6d60d9294188da5b57e7f2b7a9de421f0c7a2de7e4d9e9e211ff130056"
  end
  on_intel do
    url "https://github.com/cavazquez/ArgentumOnlineGodot/releases/download/v1.0.0rc5/pyao-client-1.0.0rc5-macos-x86_64.zip"
    sha256 "00131276f92fbd7e6bc8169603a9a8c8967524a874c721c7d78b525b6d27b72e"
  end
  app "ArgentumOnlineGodot.app"
end
