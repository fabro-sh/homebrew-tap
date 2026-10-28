class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.400.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.400.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "467073da4ca26d0b7fea70b7ee402a09c01ab94d7f96927b30b9161f514927cc"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.400.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b563690c884e61b12611760fd444a21fc7fcdc66ca4254a9619b58b40169c3a1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.400.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0373d0d712a98bc9b0c6fc6fb07761fdd97bc06683db273ebc079e5d7f985e3e"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
