class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.213.0-nightly.2"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.213.0-nightly.2/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "fa064259e69529ae3f2e318c48bd8377e36ac6efdb382587fc9487017535f7f5"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.213.0-nightly.2/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e13c6dd50eebbc7e609bb606a52b1e68be0ee8bf57802d819df9cf61a30df93"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.213.0-nightly.2/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7616dd425b21da1d40634b92147f60dd032c41715f9489d3dabbfdfc473317e2"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
