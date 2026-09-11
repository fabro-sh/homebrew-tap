class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.353.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.353.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "d744c466b2434f09138e63962306cc54dd28d2dd602b6716a3f33868db49cc48"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.353.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "25d31b4ab08dc1d3495072e29277f7509d8c338b8098dee8c7d81630dbaea263"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.353.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e21fd9323c12815528898add29ec628959d7ca801a1657a47cbd9e96de9942b"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
