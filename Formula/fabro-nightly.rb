class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.371.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.371.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "9e0b130800f0639bc57cdca963bb77da5bb11110620c2f1e29fb2694b8303550"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.371.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "718ae0821d9e27cf8f8659df85641f1bfda0105756d3840816f898bdeecfec37"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.371.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49f51b1ed92df4c11b7e9e34ce0bb48c63dafe99901a12140a0105a49542d6f5"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
