class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.309.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.309.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "875deeae784ff2cbdc42fb5d1441819274aa1c33aa4566527e429d058ab1e6a7"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.309.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee2f58f0e64d7cb736836a92f4228f9ea581b92acbee9ad1dbc9757a50aabe81"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.309.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f688a90a61b07d5aa621262f1266878b8caa860cc4340f1ccb2d86672b36fc1"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
