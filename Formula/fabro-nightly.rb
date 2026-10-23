class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.395.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.395.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "700fe22e4bae1d508ad2d6aabc4aac7b31b929072419e1f2bad8fcee0d6a995f"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.395.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c2b8fef1056a7a0c97d82a0fb1b8b6f2afdbdc5a3d3936b49a5badad2c5b34f3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.395.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29107125c59c3620ed9141c5dddf7e7567fe06d95b5ab63b07f6195298ffd22c"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
