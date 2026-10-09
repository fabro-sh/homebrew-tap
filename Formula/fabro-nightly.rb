class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.381.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.381.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "39abadd7b952bbaec1a4fffb2324fc16c9e9ba967c0fc2565234a63755638e35"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.381.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b634b5882b179f3687cb0b3666901deb8e4d1e641423743708cc19f53f40d47c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.381.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c96bda9e5a749c2402e6a45ad4f5e9e246ec9d189366b2a46647ff57a80e8e26"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
