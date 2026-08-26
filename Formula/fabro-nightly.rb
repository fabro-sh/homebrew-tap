class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.337.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.337.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "3e8b6b53db0c27ae2ac057bfeee134fe38971dda6b25c7011405a2a35ed9b70a"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.337.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5fd71b836496a67430ea18a46bcf0cf62d59dedff2a05853d67fda9ef4f60e77"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.337.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a898ff2790481597a735d2b4116e5cea9cb93610b43546433abf3bb9249fe121"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
