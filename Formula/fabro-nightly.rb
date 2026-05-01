class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.220.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.220.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "5988fede54d6febb422228ca879ffff925352dc3627a5e39ab4aa419d0254fc3"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.220.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40dfbe91d20c061e5ae5783f6cfadea36a789cb4a064b8117b954ed7ec43eb81"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.220.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a48bcfe041fbb5c4f2fd64c7f10feac7c879a621084943fa413cb6fff418aabb"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
