class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.313.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.313.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "2d9539aedff3df2e596970293da23df680a0c59470e0ed3bf4eeca2ca4a7fc2b"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.313.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7cb6b2fbf2a088f6fd25c42a980ec97a2c4f607ee9c0f357393c5fc28e512460"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.313.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1d17882f8d185affbb03914fa0310851efcda22893ff0ef0956b8164681e12f5"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
