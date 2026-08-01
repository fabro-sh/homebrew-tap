class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.312.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.312.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "338d7d68acf5f55fbc5eb7744ce5fc3c39c0c1b7f377b71926c43dd1944b1dcf"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.312.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09d2add3bfc2bcbd50774494ce3e56f94862a5a56c2403deb072b79d13c8e41a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.312.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3761e40d387910dbd607169451564fb3c186cca5c9f063fffb827c8a1b59b9b9"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
