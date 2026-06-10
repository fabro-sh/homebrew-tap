class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.260.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.260.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "eccd3c25c942ef86437ffd430d6f1c4cd7aad4559f5ec2bd070a0ba39dc1e1a1"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.260.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ad10bcefe99f5830ecf08689297d9557cd8f76496ac095e1b55a5c1d87a805c7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.260.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "792689151b569a7cbd79e83109700a268a5ee7ed12e8e8fea7703e7073b55c48"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
