class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.236.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.236.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "4e3e7b768a7ee15abcac07cbcea6e963974da56daf951ecfd164070377d5c57e"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.236.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a68bccdd24ad40e272759e454b02472d428183c8522b77c39ac1903e7a82c390"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.236.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eaf22a70c58b716189ff64e4205e260e9e2f52538713dece7ca4311548ab4b37"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
