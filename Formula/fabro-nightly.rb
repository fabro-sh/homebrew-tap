class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.346.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.346.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "d09a068ab41593fd39aec923652330e99fd9dda9c2cbe0ab031840002f53107d"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.346.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2526e803395879cf39e02c24baecd6005d3a75f54003bd37ce74e4b8b0de50ed"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.346.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57be4b2cea03c3d986af5001d8c656b5bd90d1b8512333d2d91f46ba0f5008f8"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
