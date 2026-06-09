class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.259.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.259.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "32ec83079218e5fd6b9199495bc4830cf80b1ab423fa0831cd59fd4c5836c653"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.259.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "862a0c8c32b80b9a6dd259fc2d9d86988115c6dfb958009993ceed7d6707abd8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.259.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1cc5a045be527d1ff5a12a7e80ae42581fae401255f5819a8b69a62361fb21b7"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
