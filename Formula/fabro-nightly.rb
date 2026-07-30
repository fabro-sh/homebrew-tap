class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.310.0-nightly.3"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.310.0-nightly.3/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "4c7ac42b95021338154f12dda59f3aa5ab18df461632bfcc6039251a2d7e009f"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.310.0-nightly.3/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1641d0805d3192905d519cf099fd3678565a26676f00916ce2d19099056d1315"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.310.0-nightly.3/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4bf42d6a31c88f2b71111a7cb56f067c6998afdb2cc125b19f20bf2265f5892"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
