class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.291.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.291.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "185d7d59779bcd25ad2ede9cb6ce133ba3c38574709e2fded90288472f5a103b"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.291.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dca4611d600f93d0b3793373f9a63a22042e806531c96d819c538f6004578743"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.291.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e728abcb8e47efb9b20671d5194191c74e4b8b6b9d88f9f09dd7fb9c0e2b801"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
