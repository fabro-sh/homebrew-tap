class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.275.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.275.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "e170182b29b2a29a85d9b222b688a8637ef17284d785681daf2be38f5ea6cdd3"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.275.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32b6f1b331c839e7fd4c391cf08c159c92f57aca1ad1738d5877e4d6e6fa2afb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.275.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "722bc4dd8a5d859c8582f5af5defd6850fb16c6bebd39c4f0ea08d11da113df8"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
