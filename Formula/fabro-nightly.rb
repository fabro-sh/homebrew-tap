class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.302.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.302.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "844b70246cb907d7b4282bf85b1321a5faa54251d31a38941d0f332950f7deb6"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.302.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "052351009ae94e1b4679a8d728bae585e47df1b5b5b8968375cf8359231a08b0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.302.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90abd08a80cea106d52b2d4294e8d1e36d071edf9478a452b3c729b15e297538"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
