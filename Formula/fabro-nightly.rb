class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.415.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.415.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "3b1e2144ea2113a338d6fd0eb2e6c7c61483ec0712a5179de22741cb45cf0af2"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.415.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4bf8068ef1ba753a8c6f24f23ac3079c92e87b23d8554bf699f92e91bd9a6f8b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.415.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fcdca2b8130d768b8ff22782985e519884b27805cb37d0aa7c108f4c9e774d51"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
