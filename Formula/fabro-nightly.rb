class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.240.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.240.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "5bc385f24acf4b7ec211f9d2c5414764a22a5ef8991fac8e4d41b8890c88b677"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.240.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3feeab32e93d1ae77f118304635cdbb30fbd8688a30e381f08b1917afb80d0bd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.240.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1f040c6d1ceb38234212f8922430a71ed99a5462b7a17728a17905fc7e3e4a15"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
