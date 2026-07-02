class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.282.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.282.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "87028de398ef5bcec711ff955f16eebef589c4d8713957242eb80dfc4bb79d2d"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.282.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "97a7b56709c2c73ce4ec49286584846d96372c53ee3ee28d64e9283ccacfad99"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.282.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e9d9aa8f38082bf50d7bcdc0e4916e63e8891ab4f3c9fe7c291348b26ced6045"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
