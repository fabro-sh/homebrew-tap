class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.231.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.231.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "a9fe1d5e794a3da7bc5adbd09d0f08e5adca5fb9be507370ceadc02b5d8fe4ed"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.231.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4592a5562e3fe881fecb7ff792296054d1a6cf7e48152b91468474775aed35e6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.231.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1d3774e978a740adc38c8099acecdbfae018f4125d413d39cadc56bdd29a162f"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
