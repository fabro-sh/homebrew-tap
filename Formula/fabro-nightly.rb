class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.378.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.378.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "9278ad8eca614f8fa5607ca707afbe679e0cdf30b5a66b7439724cde7c86cbe2"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.378.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "457828ee7648ee0b1b88c866efd26cf682479d1aab78cd330b67a7ee7ba34342"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.378.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c3840241e99f1144d28fd80fd1c42636eed7dba9b7af2197290cd6e5b51636e5"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
