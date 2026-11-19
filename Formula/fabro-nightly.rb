class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.421.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.421.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "e292580e903a28d80c1aed87b27a8cd5b90367f658c0e72722af236298a78d18"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.421.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c5230f1fc5b3be027a63567fcff0c4a25bdaa68c8a05e0648d382b9e33980f9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.421.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66357a2b20183dad07fbbb0f9941195841fd5908ad88ed5b5780a30ae1ca81e1"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
