class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.221.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.221.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "0f0c8e02276fc1ed5cbcecf818bc5843b4bb87fa532efd63911472ad0f228d01"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.221.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6dd4ab52a62b398a6e74c1a8319bebadddd9f86c101172a003e1bcf70aa97008"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.221.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d11527fcd2da300712d682ff1f93057555466173ce59eca07768c831a333afe0"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
