class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.331.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.331.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "fa2a819c3c39b2d1cbcddba48b17007f7fc9c55915fcbd82083d128a1249fc62"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.331.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd2c98bed69c00b5b54d7d7d55071e25eda301c3b794b4f448ca2d3720eae928"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.331.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6176809e30b0b171b79c50555396dba1522e79df6779d66258a0b980aad76b3f"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
