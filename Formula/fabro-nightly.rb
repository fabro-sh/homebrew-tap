class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.361.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.361.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "114a0facff658691467336124676a22eb8c32c487a8cd5a436342beb375830bb"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.361.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "442995dd52efaf3ff8f3afe7275f263f9d0a0736ca92e59e65d5b7e32aefbce2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.361.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d8d941e43d2f8511f24def07b2cbe8c04e35ba84bbcbf48b3bdd8db5a940a911"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
