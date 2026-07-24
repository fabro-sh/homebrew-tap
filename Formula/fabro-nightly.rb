class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.304.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.304.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "0877132a293c9b0123deb7ba9742d69136027b8a5a6de98631158de9f6c30eb4"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.304.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cdd55f84745812f0ad47009e43ea2706ad7cf4d3adaffff75a87bba55cfc04bc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.304.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dfda5993450d3e1ce1d543675435c9f400788865b3db3607933ceafb160b27ce"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
