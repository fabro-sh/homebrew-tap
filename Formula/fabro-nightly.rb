class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.387.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.387.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "cfe6ae323062038cfe587e7a93f5fba59ad0263101c0126773cae9d77c217fc0"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.387.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75616f241f9a7dedb6b5bfb1093791ed53558eaf0df6532e4817c722e8c7e1a0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.387.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b990c582e49980b46fddd76015685d5558ae0ad15f21fbe1c8623bfb823c1b60"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
