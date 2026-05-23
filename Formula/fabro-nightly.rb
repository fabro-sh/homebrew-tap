class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.242.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.242.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "81b6caba6e3d70963ff7e756ce996693a5c4c4bcaab9745dde8cc40c25d3b9a5"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.242.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8c1958801bdcfae24ca021e499f99f107e125f0937e1ec9d9e8f66021d87170"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.242.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e68ba21dcf57c3fe6b57c4971a5449266e98e0f8540f4c88cd67661d78a9a799"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
