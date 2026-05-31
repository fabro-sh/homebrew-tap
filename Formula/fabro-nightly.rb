class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.250.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.250.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "758e5402819052112e5cbd9e2a51a2f37dd8daaa91f7da947448559c55468126"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.250.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc89a06da862604b2f01e675ae3c0e67cee15434c73378afeab1feb1f0efc019"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.250.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57aef13062978e17e30be3b42bd0b1a6c64628d1c35a4c1bcc9f2fff3b62e5df"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
