class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.311.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.311.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "0af78838fa2ad516d7d502fe5d8c6207ef16cbc63dc344b82412a3f0990182ac"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.311.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a940ee82385484700d8a442416fc8c07ddb6c97e65108d2fcbe8e75277e82a8b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.311.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b7509d0741223003c47969a1657036854ce9250520258ee160356bf230f8bfcf"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
