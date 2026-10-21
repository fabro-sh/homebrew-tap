class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.393.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.393.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "c1c7353e60ef2b32a6708c0c3c6a42ed3328c02f11b2363dbdee050c2b50df0e"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.393.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba9cedcba19f01dceb5599f6a8dc1023c7ed067955e0a2e4bc9431fc51846338"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.393.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cdb1339dfef5a5df5a8d95a8d1c1b694736333d62440f65889c8b1c1d4ae45d8"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
