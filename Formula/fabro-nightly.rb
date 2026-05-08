class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.227.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.227.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "38cb37945dce7047d73f2b3a98db72d46d6d00bec370e189d6426e49b9203f7c"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.227.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e45f4981e2c943c668cb86909a3826d8566ad233ea3f7cb3492283aa6113baa3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.227.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "de131d50651ed9c891054b17e53ea9fcd512599f4937fc2b57efb653a3b36ca7"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
