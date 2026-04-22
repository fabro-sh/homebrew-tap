class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.211.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.211.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "8f0cdbfe7c84d6277af136a016c942d0936f6fe1505e50e64ce0cbb43ede7efe"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.211.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18e8ba0f42293ed3ac34e0ddf6e79c8717266f0edb75ca0480f942490714a108"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.211.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a821ecdf6ecb5a874282a7e516aa1dc04e6ebd6c445e2bfe9b2ca13c6ce7697"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
