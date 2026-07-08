class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.288.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.288.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "b6e1f67cc6950665d0e2888c829834a7c2f841ff76e66f14723aba0f96ee04c1"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.288.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70b0abf1b0f5f9e106fb8a0e092b5ca15127754b9a825e0c59c8e62bc650f037"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.288.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6d1c03352446323cde09ce8618c615dea5f1daef891f1e44800f067491bfe08"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
