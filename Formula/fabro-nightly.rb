class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.386.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.386.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "d1ad81c74bef436638c779276b4209427dec70de5169e38ae30c8fe62a66d90d"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.386.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "768a6ce65e0b326e4e66492d6e74f9b59b68f78741546b55c767f08c2a6e7417"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.386.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9623737bd1c2a4b62ed97f03232911cce5a928f52f84be167c5a0d8b053d2011"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
