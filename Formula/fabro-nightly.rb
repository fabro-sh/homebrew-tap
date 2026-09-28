class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.370.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.370.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "96689a220dc33093ce1f571768acc01aab99e113d909c6dd40b9bb6a5944ac19"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.370.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1379d23b3f883f82531f641f37ea1ffd3994eb0e9c59fd075be42f9a2d3f63b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.370.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "af4e78fc55b2455498815ba1cc4fd6ab91b562fcb382fd948312dae89150e08b"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
