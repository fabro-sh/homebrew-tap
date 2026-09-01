class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.343.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.343.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "6980dc44482ee85927568c9669bd890b976543ffd5abc1d1220d0106815ae0c1"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.343.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "021cfa4f30ffa5895cffe4941d53898724fd6a766e0f4d9518153a7bc2b3a325"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.343.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75751d1310dc7c37350f15a78bf0b0bd955dd1cbf68afffce937a199b97de3be"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
