class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.403.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.403.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "f9eba69621827f5043d3706c7847cacbae78a5793bb55faee10969becef75228"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.403.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd18b892413bdb82da93dd9d4c399665a3b2bfb081041c662ac7da9f4d622b35"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.403.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7834d4f6ba034903a167baedec32459eea452205c0146b4fabb6413f3432f011"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
