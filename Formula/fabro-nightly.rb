class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.356.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.356.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "97c8072fa247003323ed0079c8f18cb93c019138d47bda0312ea6c9a991b9f3c"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.356.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1bff51071279d8b6a748000992eda01f47d56444092382fe323fe4266544a08f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.356.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4874c832b39bc1119157087f5d13f9d2a720deceddec4b782c92bde29269e22f"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
