class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.215.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.215.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "e63d38ea1ff2209e12933ef8bd35e1f36e3e8847f84264ff68cb477f31c1795c"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.215.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99fd98c097d5d7fdc5d31a020902946b3205933fdf4c67c6bb3dc819e8550555"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.215.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee3f274059637a4facd72ae6f3a94096bca5cc814cae2a721c739963ce500dac"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
