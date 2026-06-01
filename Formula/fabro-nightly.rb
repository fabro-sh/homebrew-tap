class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.251.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.251.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "632df71e38dec458480e813e43908dfe49dfbd55326864bb66330448c0d2a300"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.251.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d0ed3e49c13703d7434f6be5614e8d2be8873c2ef07c6d6841403aadab102fb2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.251.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d10da1d76084a775b9c9e7487f12e8995403c609fae0697451ea91a7b041b06a"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
