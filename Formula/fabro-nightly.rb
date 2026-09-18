class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.360.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.360.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "762a24885dcee25e657bf7c883ca456b96041172477a0056087d6f8bd0a49ea4"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.360.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "180dcac1c91dc34a02bc0398d4b8231b51ac9a2a864a35d5f4286eae13024ffa"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.360.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "93b7d800ef51f2c376319a5ffa23d83a0407d5e88b051ce9b30dd84f45a194aa"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
