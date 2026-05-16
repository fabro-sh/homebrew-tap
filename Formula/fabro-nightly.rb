class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.235.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.235.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "fe9d73d64d3cf6cfe0bebe412c5e1141aa84c59d8db64d9e23eb62add84ebdf3"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.235.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35496a22ceab3bf0474ddabb4b9ed2ee14c9dd16343fd495afbee05007678ea8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.235.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8b235b7eb16bc22b66197f9b3dfaf738ab5676eee70d817f4f0dd43c7a598fb"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
