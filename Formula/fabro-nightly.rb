class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.245.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.245.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "47bd26610cf34b84fec2df023b862e8e755f9a0e334a2038dc4004737e44ba8f"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.245.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62d1316e0b123e500afb836d0e180a020df15d0776f11c74f747a70eb1103fea"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.245.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b353330347e35badf95e573b335e741fde62d26111e5057ff5090959ada8e541"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
