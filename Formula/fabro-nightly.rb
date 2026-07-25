class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.305.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.305.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "b253b26262a186f755e87568f20e195a7a70d12007ca7d59adc251581d7b74c6"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.305.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "204ac8f4ee312f194fe9233d553ef581162e2191e6325c11d525b072eef528ea"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.305.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b7cac23c4458412c03e7ca8bffe5bd35ae84516bc1d009c16140ef1ee241e7b"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
