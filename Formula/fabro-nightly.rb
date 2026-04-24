class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.213.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.213.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "f01611e0b32e021409d5f034009a50c29892ab7abb8d4e92d35ce0d7dbaa406f"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.213.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "701f03f5aa77947208672b66cf2aad7305ac765458e876585462777c268896ac"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.213.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b36b8fc4ddfc354ca724bd489bfa03ac669ed55e4c9c121a2c719fdd3654444f"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
