class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.246.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.246.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "d2f762d1c41292d5c941356be140b59379449d0abe6eab97d797e30180a7611e"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.246.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6315870d81e02048f386685885e87ecf4490fb3dc41bce95b71c76dc28ec9da3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.246.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4562d51f001bb507f61b45a7389c787c984ca023b2d7347676282aa24248f928"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
