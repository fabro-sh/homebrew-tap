class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.240.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.240.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "afb010272dc1b269c457fe68ef2e8728c69d422d08558ab6eee342cb4413b047"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.240.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "15a75a2e5869f63205a372aba0a1064f66b7bb132303a04ab0720c269dba0e29"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.240.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf49a06904f25f5ce3b64205f74540cf4c30b727b83555c330ba9152408c596c"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
