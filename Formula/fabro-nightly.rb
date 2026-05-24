class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.243.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.243.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "42c48fcb4107be30a343973509c911c740dfb498f23adc4535b51f8b7ab7cf5d"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.243.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bacc0845676f0419313503f7f31b12f8d8117743c2cc5e5ccbe25b6c44d8d441"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.243.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fecbec2e5e803a2810d8f3b2c972f1457a53f63fc5b8798d8220002a9be3cd24"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
