class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.335.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.335.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "20977c3f027e83cca6858241f66b4afbe406cb09c2c628d9b348c52bbe106754"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.335.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff5dca295929dc19043dca0bf2d8a3359ce2bc04e0f8ae1437baaded8b5d1399"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.335.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "40edaf6a97b6b60bae9f4fc76de80d0fbc4445c13c76be0deae7f0232cb5d92e"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
