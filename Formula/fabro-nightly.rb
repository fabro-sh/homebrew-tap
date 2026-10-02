class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.374.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.374.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "7b563530aa3657f0bad441ed5af138fb9f780049a763485325c4eadd9ffaa1eb"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.374.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c21f6e6fb4356eff47fc41d495e5cae644a2e5ca915f79a5c4bad7cba36b628a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.374.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b90d4071510ca1ee6675e0a9c157f2ab449bf318a911268a70187ccb723d5270"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
