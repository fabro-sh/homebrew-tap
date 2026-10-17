class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.389.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.389.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "8c4ac562d3dc698144f17e2bb1370e347fea9f1621cc0c966ac28bd0f96cd7ea"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.389.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a99691afe9739e342338d7a9fc7634042e9afc43a58a68888e91bc413b73f11f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.389.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0dfa3a3b50b6d6f7001785c73ff5930642705ceb59e7e88d43f6cf0b0bfdf43"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
