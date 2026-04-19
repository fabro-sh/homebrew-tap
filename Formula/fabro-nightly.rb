class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.208.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.208.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "ab58360845ac5db915532c4ac76c707cdcabcaf9b77a75d90a9497c126d07407"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.208.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "93b5366a658e03e6d4877004e38b60fea6b61fbfaba9731e8b2284e155e40bc3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.208.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "694c3b248bac3277bb4ee086ed7f309ce2d0008b27984281d89a2ef18054728e"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
