class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.413.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.413.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "cc2b75b88ea5b8c7273b29f41acbe4ecf54d569fc57dbf2b7ffd9d8c03080339"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.413.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8ab686fbb870ff4619bfbdb69a1393cf9db7530f06f78630bc66d63da6bd253"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.413.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "51691d76e3097e31ee0c3f679b4ea901e139c32ef954722a3c220bda34c3f2a9"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
