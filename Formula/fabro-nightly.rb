class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.237.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.237.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "04a8aa2010fe811b6e4d844484d7741a54d21be0039050ab5a4b5abad0170baa"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.237.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f96581b59fdf84dddfae1d1dee6ef6835e0d46f7857ccd52db94135b451b3fa"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.237.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e2f999171aee68446278670a687915e354fe46ad378786b2da179ca7ed913511"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
