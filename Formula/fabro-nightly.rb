class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.252.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.252.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "a30053e145c86f697419f472566aa830b921ff195d0802d4709f56c24edc9802"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.252.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d4fb470ab40e498f27ac70ff96311de9498b9707c015f36b9767d3b8570d20ab"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.252.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32dfdd53056b31bc6408e55d5f9bdb889192e3800b49aa8b49144278b4e59ba8"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
