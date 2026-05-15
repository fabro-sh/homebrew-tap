class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.234.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.234.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "a871febe8b02cccbd8c4f240200dbb2bac1c34444f9f9cfd60d2e9d3982bf625"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.234.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ba19c68bcb9dc51a82a7487675f2ebf9d96146a9bfee964b349fa6cd1524a7c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.234.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91a0e618a6d258387977c5ea2e6bb0da41248c4d6f0ba7c408fb6c37b84824d5"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
