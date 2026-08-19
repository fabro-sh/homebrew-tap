class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.330.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.330.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "afe3cb7cd8de4a7a14ba10efded6a284dddbc61191e5051c369ee10ae2dbb010"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.330.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4b6f30d6cfa53e86cd937b1c3f9be479f5a10e566cfc1afd6244f7fe5e02952"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.330.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d5bf3b4222553e855b69e4c0de212d4ad851f607ff25c7138ec14f2b989eb328"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
