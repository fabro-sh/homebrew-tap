class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.238.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.238.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "98860fc6124cd8f3569c9dbbba9fca0b8394f1d8abc5bf3bbb63149973fc723a"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.238.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd71c2cb56c85ebd8319910b9e00a96fdea990f81c9cfe23119b87ae09702ee7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.238.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "040084dccc3adf10f5a07cefa023d7349532f533a6b418b41cfd18fa2add238f"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
