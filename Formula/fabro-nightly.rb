class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.308.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.308.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "4d82a74dc56944f7f7bd738219bc1e52d509a8aa04677f07c3ba0a299395f2c2"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.308.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "935e6633969ed94584b753de7e818a9e4d0b982fad48e695b5fb359169d45023"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.308.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e50c0eafa6687b38a64f178ec6b8533b1ea450688f92f3ad358894ee8007498"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
