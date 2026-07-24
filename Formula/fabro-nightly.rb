class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.304.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.304.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "a904ca18874511c0a2f9e10e0180341d6a3eff2628f556e0dc49d8889e92a5a6"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.304.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a9fb64b4af8041ee305981136fdc2f4a1a377b72d7a0a72f4698717ef5def1e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.304.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ff499d3d62c36c32e6bd97dd09f6dc63eb3b734525b6857ae9d94c1d94f7831"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
