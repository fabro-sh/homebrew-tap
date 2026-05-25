class Fabro < Formula
  desc "Unified CLI for the Fabro AI framework"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.244.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.244.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "988ed2c0a9b13707471acc42d2e14d202ca152b6eeb3e70bcf31693585f341b0"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.244.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "926760f53f9cc2c5c7e7a632666a27e7dca33f403d12e9dfee5c5432563f5787"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.244.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "74b4c2c11562904fb534786931d5b135092a8dbce12cb8f8a040bbfc7e81d3e3"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
