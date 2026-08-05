class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.316.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.316.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "713e760e97a45ebba00b1905c3cb5285cdbb2415491baa7c5d4191f625a389b5"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.316.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e85c888875b5df14e8024f6fb338a318c4c6cf599ee1d69b7181b8c58511e43"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.316.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "93dbc7b3e20de18d953365631331d1aab7035715c9fe9d186df1ca7e691561af"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
