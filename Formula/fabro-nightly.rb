class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.281.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.281.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "52941c91458cb215c319e90f95dc15ee62b1d950671735b8171b3ee520d358ad"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.281.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c2a28d1c0e3bdc16533458c73778315f551dc94cfeef547673c5b78246f95d02"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.281.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c778b9a623e044ff1ad03ea5a1a76a2975c8b7836c9d4f03d44f2aaa68e2e864"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
