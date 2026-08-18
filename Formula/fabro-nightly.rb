class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.329.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.329.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "12206f897b781babd7abbe073b45cbafae5f886c0a45e8ebb940ad4aedf60ec6"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.329.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3bb1697342714e7c97cce733dee06f5af47487d08d17b4bd0faab9df32bfa62"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.329.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37737ef7b58552fd77235ef8374b3ccad5f25193ae2a70dd0b7f2122777ccb9a"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
