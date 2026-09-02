class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.344.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.344.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "e4de4b9fd430bb35713f8a5ad6a583d3f9fbe52ba8bbe26282c7032ebc40a464"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.344.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b79bf38cfdff2051d04da62a408c233cab9b5a453c4a5cbc7a2650d1f4538c46"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.344.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ff01ea80432cf1a8b8600de64c42ee42dfe0ba6f553d0cd9b387c284e4d1c39"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
