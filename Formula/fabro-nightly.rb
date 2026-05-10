class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.229.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.229.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "bd734def858ffb13fafd3977188d98857b2010059c59cf81c7c09d9ce3e13b1f"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.229.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65668ca471595dd8769851ae57d29a25eae68915ceb58d2474b1dc53b78038ab"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.229.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b55a036109e4cfb5ddda432faf14354a2715fdf5d77198730093db0e5d44c59b"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
