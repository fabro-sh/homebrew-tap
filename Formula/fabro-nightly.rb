class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.348.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.348.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "049caa5119fe27509d5cd1da1f42d98ed0c2bb68880447da4a430d7031b7d717"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.348.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b43427cb9f40e271bf34bf0359904b196d7e2a36a64b1dbed2ddf1d97e1ccf4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.348.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58ae382f7459dff9eb2e7f3a01b068cd34a1ecfac7df043837c2d0e72dad253e"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
