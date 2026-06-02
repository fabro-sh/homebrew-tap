class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.251.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.251.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "2ae1b4b8bd78b7a044effbedab0c8f7b985205d0f3aa3de45abb8878a5c2c32c"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.251.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc6e399aff1e4c9991bb15fec43f5364a542c1f95937d2ca3dc1b31255085889"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.251.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "08f53ba65e127727e6bde934c333ff7a065c1f3beec0c7177da0f8db4ac85a4b"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
