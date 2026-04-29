class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.218.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.218.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "5f2cba2ef512fb95300388ab7e1a5a8da433d2bc63d84f2ee9c9b399834a23f8"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.218.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5add6c321d826f6a66753a67f1c8cc1dad140f19c4f75b7ca394e5bafd25a375"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.218.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d866d308f7a05f653cd1bd24a16cd3e3651d11f9562fe06af02ea759c4ce4ec"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
