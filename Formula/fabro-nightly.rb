class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.211.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.211.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "2f4b2b5c0e77be2e128e056c773a7dcdcfd969da23acb6993fc243b597b40bad"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.211.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b1521b91be6878595c3632808a6a07acc7f9c329179eabfd20dfb7a2fe7f4db"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.211.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29051ff8becc3f6504b980f49812fcf146fffce91f24181a92d07396b4f5193a"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
