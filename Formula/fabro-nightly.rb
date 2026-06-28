class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.278.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.278.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "097945d8b221fcb4eb50d1ed74c332a6f984c3767a8a82b108acd6c91cb027be"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.278.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79de58e04011aea1c369cddfd2ca7c7ca45f00f6ccfaa63eba1f0e4c1fd77ca6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.278.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fef21e158f4ec100d9bc951a729616c4e531bdfd62ea3b1c8f20be659b45cdad"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
