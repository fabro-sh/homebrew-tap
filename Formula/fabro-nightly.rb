class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.414.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.414.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "492692a4d3d23f02ab6c6c47c9332655fa692f801af1b901939d0f38d7baf7c1"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.414.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea8b9f9d5ad836ba04a15c6753123d68659cf529e65fd810fbb32a071d055511"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.414.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b4401afc01d13eb34dd5779b97343ffaa6e37c6375e1ff7fa9aa464eeec746a8"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
