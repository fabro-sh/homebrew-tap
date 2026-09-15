class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.357.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.357.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "8c3a4a733550b5f0110c0e10ab9c0fab5654192bf6a13680288eba6c1b190d72"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.357.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3b8c023dad5bf9dbcc46bf53b6905b28185b667e59dee13a3b5f05c4c937654"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.357.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4803489eed1f3a8d8f2a1a286e4c06e9828da458b12c5d2341f0c3fb11c3cf7"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
