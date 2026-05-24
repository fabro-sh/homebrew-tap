class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.243.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.243.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "c7e4a34cd080a775acb865081e6f2bb8224f435542be2fd19855b516fba7515c"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.243.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18dc7c7fe5962091e752c8acf38ebebac6f9c28dbb2c299b9e0f3fa08e97ca3d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.243.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "87b3daa90d0c8c0ed90cff90ef5f0fdb9a8044e269f59a4772486c79b693cd2a"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
