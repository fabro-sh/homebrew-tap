class Fabro < Formula
  desc "Unified CLI for the Fabro AI framework"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.227.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.227.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "92b4dd968189ca1c0f4fefddc7df6b816f8a43361a8b01b5191fbcd3d3c3ac68"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.227.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc30737bfda11fe69e1c534ca8aed5a1493633a8a3cc1e8bde2fd277328e8ce2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.227.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a47b35b6e54bbdd73900935575caeab6e6b2f764143deae4677e19acf6b8459"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
