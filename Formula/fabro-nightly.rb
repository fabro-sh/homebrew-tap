class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.332.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.332.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "15ff0e962559253f418086a8660904f94a403ce58870164656b11eb0a2b3fb01"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.332.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31c4f71124f9be7a49643bcbec4566eb26ca991489150109ecb49bcb1a2ccbcc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.332.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3a181d52202f83fc39ece713e3965512a02bf5e12264ea17dc685db8b70b8b5"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
