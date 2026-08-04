class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.315.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.315.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "788f53ec2c8eb7d47dd5c07441ae718c1560a9af8e5928860569917afb80e853"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.315.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a199f1f044035aa311624da8226010b9c65b679ece6d79e55abda14205653f1e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.315.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5658fc62ad97b302205071e547db051df45feef159eb8cbe59579e058fbeba11"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
