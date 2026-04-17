class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.205.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.205.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "61b0f665cbf340eb798983de013396ef68f8b66a762c967daa0743947aa5960d"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.205.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "791ac31b1fdea53e5364deeb40ef5e88fab6e21d65d3e3ef6c355edeb5cf9314"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.205.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b6fe009a6f41d80ef0f77bc39d6afd991cbca37e167a67b9b80d4c1f30ff32f"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
