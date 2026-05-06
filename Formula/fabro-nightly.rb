class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.225.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.225.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "ef7f81ee0717da1505115efd08ea0132fbe22341b6a5e78e771714a166007b10"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.225.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e5ecb02379891be88a0ac901b5fdff184a28eb8912a7bf4de1ceb3cf8f665f3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.225.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "45fc4c457519460e55d3a4483203628a1da61d2e9fa9e886cd501079fe4a8280"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
