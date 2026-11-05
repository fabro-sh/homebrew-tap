class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.408.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.408.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "b584274b2458b68dec724b8e9f9dc8b54c2aee1d44893003ac0f221a9e56ea92"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.408.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "363bbe346e6ab88fd33189fa9dc975b9d3f6b767fd7bcf1a0f52f9426e170728"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.408.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "932f73279ae83322499f337b4c889fdecaca1ede2901cdf2b9fb33f76f606a17"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
