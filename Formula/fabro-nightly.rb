class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.217.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.217.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "5b2c6a26d3b4650bb14ee9ced92774b43802c7a984e23ae536b0473c02e2dd6f"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.217.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0629e10ded0db9d49a28832b61c3a16394115cdf7dd873be415b1eadd43c21ac"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.217.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "628344b742a0ad71d3e43b2eb95341ffbbc74bf2880692216e2ef91d7b9cf776"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
