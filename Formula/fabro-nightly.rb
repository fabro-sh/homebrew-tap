class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.253.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.253.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "609ae3f3d66180e9889a8c48e8e09cdc4675a8e246648f5bc595d76bab16696d"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.253.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "440c92e8c4640e2d4f90dcf94d68443f9a88ee1051aa02ac2a8c99ed062af688"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.253.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "42bc4811a6982c4ece6f8581825d6d21b82f3579d1ddfb81b87bc466f076ba4b"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
