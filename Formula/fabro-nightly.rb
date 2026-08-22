class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.333.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.333.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "0096d582fe8abdb5486b8a5f7fbea8ac0759b09868e6035c964899e766e61fa2"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.333.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77a2090ca3a84350a6fa158d5ec5c9a22ea01ec2eb93e7739e9be292bb6086f8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.333.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f42e36740d9bed2c9815868b127dcf797d8bb319b2b1dfad2c347c30de14d7a"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
