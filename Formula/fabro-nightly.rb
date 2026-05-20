class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.239.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.239.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "bdeff8c16e212245cf6052decf4c2992cf111fb365383dc9009507d4ab09f202"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.239.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b6a992b11392d2f23b3a78114ed4e63d9ce38355549621a7bea0c803e9926b39"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.239.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ac083674398ed1908c1cf7ef84c900063969c997e8eceeea2fb2ed05fba609ff"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
