class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.354.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.354.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "a24e478127f5e422c2a183a35b07ad46e1b48ed3bd27c2bdbdaeec34e3f71f15"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.354.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0188985dc00f38b79232aea78d42a3c32db031465e26e5d9e0d64b3e85b0fc9b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.354.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff3c57b97e4ed42c16aaa88a4b1bbf3df9d714765677b0c4654a3af881bdd027"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
