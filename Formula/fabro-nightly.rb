class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.241.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.241.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "f1e947363a2376b7a83369c53ec34b21980e8e43d0eeb047ef915172a30f020d"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.241.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f9cf1e7f80ff3d663ab82d71c7121ca4cdf480dafd1ebdfb572a87f31a1784e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.241.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d64fbb9fe43b4eb9d3a5e1638cdb05a1c3d16d7f7a0e0f242ad6e719bc4180b"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
