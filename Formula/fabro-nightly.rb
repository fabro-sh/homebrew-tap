class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.277.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.277.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "9168c28bde86a16abff89716c8f4930017226af80b6e67c4be02f635ae8bf60d"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.277.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1f8072b9d9cbb3d4793dc2d3768e5aed7d6343485b7ba204fe2fafbb927b1c0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.277.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "54646aa589ba86d0f5441562ab82c295c30a8dbf793537889883b4110eb71ab2"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
