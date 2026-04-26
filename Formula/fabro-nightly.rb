class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.214.0-nightly.2"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.214.0-nightly.2/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "8e51b467dd6d509af399304bfe437459c422e8ab42484b3dec21aa7949ae22c6"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.214.0-nightly.2/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44f3ecc4dab1dcc88061066ba32705df8a7bcdd4f45f45607f2dcd5ee4097762"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.214.0-nightly.2/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "28f3ab7cb2592043000f0d2f452373c99618564959dbc29aa5f94f0748bdfa6e"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
