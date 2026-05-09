class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.228.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.228.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "e252631b6a232cede42dc99725c06165657f83897b9830242e45c7cc6f5f8d06"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.228.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2426ae56030a05c96fae88f8e6fad30697cfffdaed7d5163ddbd4234bc91e879"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.228.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "00a3d014e8c0ac30ce342d6e2e20f3dfc0f92c7e6f2e810409f8d0a5173b780c"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
