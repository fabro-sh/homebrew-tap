class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.241.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.241.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "315bd4080efbb9e1e06493c0342920bfccae2789b9ece92e5f590dc7db4ed14d"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.241.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "323b3742e18f8cc31bdd8dc00c43c7cee228ae1356f9e89a2f7d6d6c8d25e8df"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.241.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4c3524e0e7ce3f9dac3788952066aee9cb539d1a873ef8f06d595d7792ae5165"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
