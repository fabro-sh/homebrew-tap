class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.336.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.336.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "b0962be9401286ea4bc58208839ec87108a9b37d6d02548cf09a64e7cb974b7c"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.336.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "750f092981c5cfb670565baeb4c913a6fe6fe1a5640b93f920a4cb6a86d83287"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.336.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "376ad200e3bc6db22498aff60184218d284ae47abeea82c4e2eff7341a15836f"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
