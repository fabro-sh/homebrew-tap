class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.312.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.312.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "737b07f8f195a0d6e0c8c0a22715eb305a4b940cfa2d1d5212ed462f147537a4"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.312.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "265414c59427224c95d95bc85ff53b6c065b811b35dfdaca9b3d2e3d71d75650"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.312.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0efc01a067871a3921aaa19f64676bcf38917d9fa195edbd08c46c1e2986eb4"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
