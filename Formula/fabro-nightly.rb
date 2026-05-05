class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.224.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.224.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "5e0212b7cf8e6e5a91a5216441db15b8e0de28d691493aa8e1d658463aa4b831"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.224.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69f86332865df30f4e031984c958d3d50fcb8491d91839b2bf8bb122b79c243e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.224.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c901b5b6988fd3fcfc84919718edfb79ae847a459029a5e609107a61bb0d323d"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
