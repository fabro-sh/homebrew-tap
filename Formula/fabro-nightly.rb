class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.207.0-nightly.5"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.207.0-nightly.5/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "afcd41fd803023afb4abe15d53dad3c2a88364f7d24fa88b3b064abd3d8376df"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.207.0-nightly.5/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a6d29ce58665312769445c68545a1043ad2d8e6e3c8638d26b8fbe6c2d833545"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.207.0-nightly.5/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "036effc9f1b62c7d53ce26bdc83c2f285a455d9bf2edb6b0c287a5e460b011ed"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
