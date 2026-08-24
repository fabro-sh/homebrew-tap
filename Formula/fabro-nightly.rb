class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.335.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.335.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "a8fa42e7632d8a3f2ccb88d7954c46e940637b76a488652d46bf8ba1f1487fe8"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.335.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d2b918dfad33594bf9ff7f63f2a6b42d3ed0495c9ab7f014f5d495403221af5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.335.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a59300b72dd5fb292186c179b660f95a5ef22e237d91d3a045d37a80335bb78d"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
