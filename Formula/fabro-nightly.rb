class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.255.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.255.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "b762dc05c42558fd8ab77f2113470e91b9538530c79c528402eec8091029df95"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.255.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b7b769e4c9ef0449f54088335daba44a81c183d1246a9af5d3069b79d042d225"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.255.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "099b33cf7271e117a69c102241715c13f812075903618ac1fa7e188bff06b483"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
