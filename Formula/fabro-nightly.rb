class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.290.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.290.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "0de5f22f2c7de2972e37ea250f21a589c0bb5adfa8fe0c239d5a47d932e6db7e"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.290.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ee7a606286be6a2353b87c98a134b137a74dbd653372987de1a7e59ab1b91dc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.290.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f70fa96f061a0f848b5cb5e21fd3e18d002d75bf885c4ce8a73e754eb9942bee"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
