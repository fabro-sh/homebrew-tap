class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.232.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.232.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "83a06fdb970e6ed20bea69805159a7fda27fb0bee0a429b85d06c0a57e4a6e89"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.232.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f4b5b233e068d627618aedee0801bd82b9db07c87beee9b95c17a31b5f517da5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.232.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "292f979fd5b2213b84d1f6f88c2cc570a732edf29554777187c510427eac9d97"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
