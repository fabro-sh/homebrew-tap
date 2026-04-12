class Fabro < Formula
  desc "Unified CLI for the Fabro AI framework"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.176.2"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.176.2/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "417f2b869ecbe4825eeb9ff5ddbb9a011f966bb5c038673b295b3ce9c3854fec"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.176.2/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1cce04f760395532dd431595e0fbde60610b187a0a5878f64167dfe24724cc4b"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
