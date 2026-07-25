class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.305.0-nightly.2"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.305.0-nightly.2/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "5ef5c339827fc2e20cf9f48a703428c2860f4168efd2cf6cf21230a0252a23e1"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.305.0-nightly.2/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0add95733e08f283fb0f9cd61bf3213b5a446772741d4a0f9371ce44047099db"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.305.0-nightly.2/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0440a63434643a1ac5d06bc3144cbf426f3808eee4f9a1af32ec0d213415552f"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
