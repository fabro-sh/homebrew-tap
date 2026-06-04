class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.254.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.254.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "8de3d6ea79fc24c26c55418e139f54ef531b343895f4b64a29226f3bb88b7cbf"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.254.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fcb3bd9e4dce05e50b475e7c7ce086a3dc313f2a0d93fb5f54309f39dd2a3aea"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.254.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "00b2801ca3119465a2b205479fdd1b5329c584f04575678bffadc2dffd241269"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
