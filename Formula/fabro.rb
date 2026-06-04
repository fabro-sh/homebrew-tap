class Fabro < Formula
  desc "Unified CLI for the Fabro AI framework"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.254.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.254.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "cc77fad7a34ceefb4d2ee1e7f56a4f3fb1aeaf993069437e6a309ddcf9f53f10"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.254.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ccfa12394fd928c3194fd9af04daa9417989b9e3f9cb37d71a5df63f3143e787"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.254.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a87a599822494ca2b946229cd3a12a8d51f62fefda61980296116e31bb8e1f6"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
