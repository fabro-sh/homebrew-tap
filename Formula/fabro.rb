class Fabro < Formula
  desc "Unified CLI for the Fabro AI framework"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.252.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.252.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "dd873bbf9b471434868e5f4c0d09501ef6517417d51c507eb81e5f2b72178af1"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.252.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62dd92ed8e86416bb2f6c9f92a6870696f2e14338b12f075befeebe9221f95bd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.252.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ede0af1ca0b071767d6169e7e48025e3041be2d2eb707761cb463e484afed984"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
