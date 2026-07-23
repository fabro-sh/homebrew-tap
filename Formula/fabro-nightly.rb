class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.303.0-nightly.4"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.303.0-nightly.4/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "135dbe23e68bfd1b3deed8019336169196d76b17bd5e25619f5215928e2d5a50"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.303.0-nightly.4/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a706659620c0f8d2290abcde34c310789ce4d6b7cab74511cb4a302d6bee56d2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.303.0-nightly.4/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d8ce9fd5880d3b5e046da5a7d135a5ed17ea8b7bfb2181eeafd88eddfc734b7"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
