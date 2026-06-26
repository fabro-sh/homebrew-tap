class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.276.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.276.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "7a387e615285511ac843f7ae65fb3ffa1b54c1fec1c1012d5976d7052397ceda"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.276.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b0aa07c3d84af77b657b33e7f7ba69d2348493b604091ccf039bdd429832c5f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.276.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1f9093ea013a3345271190dfb879a669219bc5a0d5d85d38a66df690c94b3304"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
