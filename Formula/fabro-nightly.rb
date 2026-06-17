class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.267.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.267.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "533edd51090c172e33d05c2367aaef1fa68c2da6c4d1e40f7f5df9d2c37114c9"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.267.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "23863d4afec541cb4338b758e0aa84fbb89c193e7844631304f0b55922b8d8f1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.267.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3408a2d772209cc979251b9e820772efc0dbbb21699589f1d3f6af755c79553c"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
