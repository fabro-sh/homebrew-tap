class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.345.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.345.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "72ed0460e386f22e8fbe6fa84efffda28dec61923cfef3ab403ccdaeadadac9a"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.345.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1bb62e3bf423747873ebfaabdf551b77f5b3fea98e313deb0071c8c97904e278"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.345.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d9b334ababa3aee480d67a6a1f3138d0e6c773ef05c29b5b6db1dd2fed348c3"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
