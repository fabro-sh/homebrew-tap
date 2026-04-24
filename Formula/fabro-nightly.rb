class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.213.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.213.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "cae0e712566713f02a978ad4e404c4a4cc2437b8241f8f650f66404cfbba2115"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.213.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ceabc0a82fb411b6ee52010b6304eb962fc0dc863667d54b514732d7246db3b6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.213.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2314d8bff0d3ff28118d67a92e810fe0a46de487efab93a7a3b227d178a1e690"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
