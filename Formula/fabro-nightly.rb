class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.396.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.396.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "80ea96af6ad8a35056719347f30a1070fcc1aab0d98c69d4ecd5abaf6d0b290c"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.396.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e8be50606866772532add6342c27f0e6ccb2888fac0ad20f9e8ae87a81611c9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.396.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a6d8f7d4783f55753601f1af1b87028c30e731af6d416df2113655488c410f3"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
