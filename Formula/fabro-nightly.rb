class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.339.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.339.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "4c6234bff3ec539673dc8d86b95b117beabc6deed3078b3937d27fd5474f27f2"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.339.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "694ac56c9ce230c6cc1f349bcf5fbe468e3399e35c6522895cabb02fd1679099"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.339.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4781fde400c5c1e33b96ff5f8f56b901531393a37165e16259b19acc4a3bfb15"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
