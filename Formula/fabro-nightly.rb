class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.244.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.244.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "36ae6a47b2e2a123ad543c473d8667af18d1112c4d7175ceabdccbb132886753"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.244.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ab47c7c5755585029c9eaf44f8d568fa8090be77074950a4cf4c83085e87a4e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.244.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e49c6fbcdbc9d155605922b0b1e7c8a9fa012ea8d4fbec1528a2e108429006b"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
