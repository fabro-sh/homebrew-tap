class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.237.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.237.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "f599f2e67741529d3d0fffd1a15defcadc6515b5764c0dc387996dba92b7046d"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.237.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f628af9d7eaeec194eda0a5395451475d40f6ac9e82eb0355165aaca83a6661"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.237.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "25e05c4d439bc12f5d218295e627807ca2028475c86d66efedc95a0556a1fbc7"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
