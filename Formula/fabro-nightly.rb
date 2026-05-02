class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.221.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.221.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "b1026ccb0e1b9ecd0a8ae8cccd3e97443c57bf42c9dab627b7acc4d377610f03"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.221.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d11dab50c978589886e3f950c50c2a0db07871604f9619c3bef633bc478a7f1a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.221.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "419c3c5d938efb4818aecdc03f5c5c15e9e34a68334e3320ceef522bc398f2a8"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
