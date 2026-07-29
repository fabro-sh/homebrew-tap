class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.309.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.309.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "00b90b7f0dd2461930aac4b25f6bf94b54ad79c6509e7c779a78a821ab232890"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.309.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a5d277148f0b138164f6baacc5e2c18576f006369e9908cfe5f9d81c3e6f31c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.309.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dfff3c922c4e14c9f7a6134f369808ffedb8e6236a8144c2bb5f65dda75ebf80"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
