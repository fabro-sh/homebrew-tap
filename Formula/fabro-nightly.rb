class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.342.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.342.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "9883e3637dd375c16ae36b3659d020bfce3283c594c6a5f69715ef5c3673be01"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.342.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27ac9775331c5c8846bab3ea967d40fc1331a1daaf20d6ad1d05d7fa022a948f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.342.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7d4e2d1c6f380f452f7bef74bd4c2b06884ad138135c9a897293ebad8d65245"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
