class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.385.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.385.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "97a78d9c348a39313072ec8ac5459c24bfbb6d93e6a434ff3d3288570714f36c"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.385.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88d8ac4440d799438e1e7d276dd856f6ed3fb29ac25788d8bd554ea9b8700f39"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.385.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6cb915d8c78f5481b1d9fbe522e67079e7281447f922610985e2df00b663e4f"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
