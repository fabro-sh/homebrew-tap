class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.256.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.256.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "f99b46a2853ddce5fd3981021e9ba91cd079340e36c2d5090efbd2fb19e90d5b"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.256.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "02fdec8a78dd7ba02ac2253dcb497366bb8e5e7d36d7923948ccd828b523adca"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.256.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1aebcfaf27d3e65d1f50b487b67c36f3de09f0521e726e2644e0a43afca1b85b"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
