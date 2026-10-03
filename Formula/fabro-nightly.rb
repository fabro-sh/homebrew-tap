class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.375.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.375.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "3fa4331314025d8e43fb68237cceb9a32a3af444fc00fab77e9ce06493ebdb52"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.375.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7250e73088618178ea6f109906218bb09fbd6a5945758aa0f03a6d8bb747280f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.375.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8be60efa57da22f361d3b1a87a175a280eedc2051266218dc0e927da1bfb9325"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
