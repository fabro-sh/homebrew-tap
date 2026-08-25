class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.336.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.336.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "32f8740e892ef3f7bc9dcb6db363e37fecd943e757dd670db18dec306a37125c"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.336.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f05bf87668c7c0f28f17cddc7499fdeddfb2fe6672fb950f7c0c23a0526d2f4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.336.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57e364319bb01b731b79b8a9e19b497098fa4c1d1ebb323421f99e8ffe937dcd"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
