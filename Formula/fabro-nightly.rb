class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.227.0-nightly.2"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.227.0-nightly.2/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "4e876859199f1dd509ff4fae1e2e40eac33e456974124676083a37e380343f8c"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.227.0-nightly.2/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ad47a9d8ef354ad2bd701259001843cfb2897a02ad0433690327ac2decc20566"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.227.0-nightly.2/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f9a244da67de2337b473eaba7bafa24204c97d76d518ce3f5564e5797971e819"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
