class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.227.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.227.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "9b0db0bd3cf2df885cdb5d5184eff082ddc743a2fd5949ed883d6d272b2793df"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.227.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a63fbe47784579122c20ef302c5f3b09e84f0260a72898568f10fe25888d50d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.227.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b86b9900b0edfa78bfc3446805b5df8f4c931e4497b647831e11546b56584a20"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
