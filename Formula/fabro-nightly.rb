class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.233.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.233.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "d783a3ca1ffbf94056a49e5395f696f3876671c27c6cd6cb4fedf5acb28610b1"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.233.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f7a931de103498c8d77084aaced2d3bb8ebecb1914441c29ea79cc9b5c6c2a1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.233.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57317e2f7ac01c2a08ce4f85a1c7fd5d0d01fad3822fe64d7bc900954a065d43"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
