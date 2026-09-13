class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.355.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.355.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "3d2ccfb33d6da44a842af9ad9a1785858f97e1e8fba4595100e18160d38c1c16"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.355.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b57236a1475e7b9e4af3fb7cb405e1af8f6c0f7488641a56c1ab5f4c6ef5e0ea"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.355.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7e3e377cd978733233608d4966f8e3c5f07f283fac96fa73e22af44c2f8c410"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
