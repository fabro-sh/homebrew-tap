class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.209.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.209.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "a9e6ba8ec42a4040e1e3b8a82d29bcf99baab966f2de566c9e9dd3eed33bcfb8"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.209.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "71ec29dce3f3c689fdde08f893fcb9389abe9d455241aa2ce651563a809c7663"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.209.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "53297b0d1d04f92e1ffec95257e8f5b6eb1b85c0b34d6fdf769a046389881c71"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
