class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.283.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.283.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "b60482b3791cff72a054d11cfa8c1dd7213dad125ad4bb7ba5d48e80ffc117c6"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.283.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17b43decc76b73389271a3eb454cb1e52bab6ef82eab967e6b0f762091ec5b1d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.283.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "89900b559ad49223a59e198e9072b544cf218643e63be1618cf79aad52e7472e"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
