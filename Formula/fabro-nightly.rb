class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.220.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.220.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "07c40b3a5e21b8386a469149fc25072039adaeb6fdb7a2aca91b35c24297ab33"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.220.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a58a4fbb03c30ad4aa45d72a89c08c102cb6a126ebff33652b9476e70a8fdbd8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.220.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1caeffd5f37ef390c02333be39e43978e06e7afc8d01d562b16819122641fb84"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
