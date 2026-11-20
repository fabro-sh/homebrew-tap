class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.423.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.423.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "1d269b029e0062a6638b9d6e2d197b4646540d3b03d4651901cddf486c92170d"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.423.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "604cdc83825677144b4350fba6273cbe027a8fff3168d67fc98bbbc3b892bc05"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.423.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "db2a5140742cbef03464344467516c89d6ebf38b98fc0a7d716d144af15856c7"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
