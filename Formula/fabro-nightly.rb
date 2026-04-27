class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.216.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.216.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "b9ed27c509d41a14472e00f1657db0868f026c0cb6b7fcb28b81e8b69205b34e"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.216.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf249719f9ffd22f4995a031bf024048d3452a7c1e061b5849f203bdf294c66b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.216.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "995b42f677d8e0d10d4cf55781d70e16db65dabc7e4461b9a435c446f084d534"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
