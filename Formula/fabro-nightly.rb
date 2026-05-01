class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.220.0-nightly.2"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.220.0-nightly.2/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "f12e75d0cf32a1e4d502134f06c187e89526d1c96b954a1c6c022b969897664b"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.220.0-nightly.2/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f09990f3c8e450b3a5d27008668684968a9eedc40c16ea30969a54ac93ad72c7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.220.0-nightly.2/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "151cab74dee221e3d12d455432b6d58488ec3bbbf1ee20e055c167142c265bcf"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
