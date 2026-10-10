class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.382.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.382.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "d622fb7f87996053446a4259737dee4b894731723c2188c1872fd5c8959b2d7a"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.382.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c976e0eda5ff0a99a5d491a0651d383177d7124d8937abeefbd98d85a8c79dae"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.382.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d55e27ccfbbd9c63650b07b98b13f4b30b3cc01fe2c62b379deded19052b5b31"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
