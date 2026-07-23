class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.303.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.303.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "c6947f6a2e373e6cc9aec2bb9a0fccee617728310c6455b9eb3f40b79f764f0e"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.303.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "93f1ab9939471f3594e1d148119de55bd832180ab7155a67b2df2feb4e2be3be"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.303.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5d8de1bef95e1213b03aa75a84d2e16b0d572bdabeaf00a7f8d1290759a482f"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
