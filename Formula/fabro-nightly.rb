class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.324.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.324.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "2a9cf3720d7b37927b439c6cc94e09e3c185dd46ff32f9e057612b1feee92a34"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.324.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29651cd6e8af76034e002e622e651551f68bce6ded6be457cb9d16e8bc4d0439"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.324.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "137a3836a472891375db1c3170c490912e77111960a323d906c1861fd5f72999"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
