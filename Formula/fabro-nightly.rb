class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.242.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.242.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "878a5054cd0edce691f7b24e27243f913b9506ab895e8842b63585cd16d2863f"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.242.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "14e73fc5280edb4e36b231baaf956434871594532399b096ee95703c92c961c1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.242.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "913774131e0f1d9c4520625db7a96701b8b16f9354b0f7c0f8e6ab0e13a166b2"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
