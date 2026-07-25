class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.305.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.305.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "e10d39350a3fdefa81248b6d6090af794ac0e08c50016265fe88175c568800c4"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.305.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e383123637162bd5bde159027716e9ded9d682e03b2b9c0d6ed5f2105f1dd1c2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.305.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7f5e0804db55b2c8901a17aba1aa6910f400f8385a41c3aaa84b39ee3a290bab"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
