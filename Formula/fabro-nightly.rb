class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.293.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.293.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "c489a5cb80c42e159f331ea9f1993e0d7333e51cb007f90ff82b3c5d98e8ef54"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.293.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3a5c636012308f3fb3ee03c98282f29ae0b769d7d608e1b20b04d48df46adcb"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.293.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "469b8645c9418d9e52ed5f3c087dac040a9b71962041ddbcb8046b82aed79b53"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
