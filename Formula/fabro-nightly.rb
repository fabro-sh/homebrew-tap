class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.337.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.337.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "2140cf5927d23bfa480b93e0ad035e52919835c7e21ee0b3bfe0c508abbd1d80"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.337.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ef9762e5b590786e3ac1db27f06c638009824328ea2820584b5142f3b924efa"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.337.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "649858c4ee3a28a8d0571ea03bd1f6a5e5382b9dfd37ad583e6c3c70b3090b2b"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
