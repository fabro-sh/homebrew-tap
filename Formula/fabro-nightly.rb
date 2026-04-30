class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.219.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.219.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "4ba450422a50fbd386ab14ef2ad477f1693a263ba6b89294c13aef34171baade"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.219.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9fc8069d26ebfd298e946f8afd2ebaa7c73a377624578a424cb8e89eb48527f1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.219.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bcc3ef0f3d73e3f993e314bcd1f722c98dd3b3b676f5f81e1ee0dd9372ecf216"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
