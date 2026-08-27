class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.338.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.338.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "0d794f430e1ea98e793d8588d5d897c16693ea510258c457930348a05c53b129"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.338.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b2a945dfebd9df895611061182714393be0e4a828dfb393ca6f46c36c35cf1bd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.338.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "43ee41301e80b4f0a5dc469366d8a8ca28cdfb8d2060c2459fbe340efd452b19"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
