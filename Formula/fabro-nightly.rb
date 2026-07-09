class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.289.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.289.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "2750fd754ec87803d25a74a692a7cc7df5bcb95b5aa03d87f5c8ccfb90564a3e"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.289.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b451070e89b189e1867ba8b348afc80b1d51a28443bee3a484d85bfc54272d4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.289.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e6de14b48c003c1297922c3398f3b7c1ef349ee8222dade7e279a67009e88252"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
