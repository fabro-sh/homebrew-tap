class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.287.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.287.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "0c67fa32a2db03504279fe85aa42c5b30d7acce0dcff25427bf40dd1558512ee"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.287.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9f6f66dbc2012154ce31120e3602e14b3432f59db68b56894886b19891c8bc89"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.287.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0288d79f8a2ddb23afb236b2b18723f7fe113001fd8fd2882fa0ef0423817cc9"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
