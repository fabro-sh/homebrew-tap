class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.325.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.325.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "f0df291ecc8ef1c559669a044dc1d03f2e3bb225b344069409271d0d406ce417"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.325.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a59e0035655c21ea239f1d86394909011136b01afabb4f75eba00f7d213928b5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.325.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c4938099a3c6abede98f99cb0af6a94d2c6ffa4634e1416cb0cd8ec250546c8"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
