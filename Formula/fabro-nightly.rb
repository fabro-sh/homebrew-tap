class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.305.0-nightly.3"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.305.0-nightly.3/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "347af177b6df5c9419202f3c255df052b42f036b26aa08c6c7c89a20e9fa933a"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.305.0-nightly.3/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5155d93471fc33a3f6c73d3bf5f480e9194b6e825f96fb4a4869ad1f5cee5caa"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.305.0-nightly.3/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17ab4eb48f2b2d4667417b4623c564a8b9be40e9814849e75bfe81caf8b86116"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
