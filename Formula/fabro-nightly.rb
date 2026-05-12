class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.231.0-nightly.3"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.231.0-nightly.3/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "94a617d95c241d9e70d71252ca28693873001ffa02c86ee80df74fc025492112"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.231.0-nightly.3/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b6cc8febcd4e2fb006b06b7ea6d28b2655c3adb3204ba79a8f708df9a7a8307a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.231.0-nightly.3/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cafc42962c479612025e53836d4a4b683fc9cef6340111afb3eefdca5993732f"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
