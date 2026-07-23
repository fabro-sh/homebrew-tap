class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.303.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.303.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "0b5a946fdd2c6cb4c41c72b15ee3bcf5cbd9604921283b10f6557b94cfb19a55"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.303.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "166274999afca2c09085bcb7ccb609163e30109a22438bcc0bc1a5225af93d79"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.303.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "247fd8093e3659d2445f96fe0334230738ab5e25165168f418a2ad2df6c1dc6f"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
