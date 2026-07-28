class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.308.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.308.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "7eae839e4098f4d2359ef915b61b511e5a76e859fb77b37a74e94c75173566c1"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.308.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21a6d51683f477d123cae70f53cf78fb9627eca704eb1831a2ec409dab9ddae5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.308.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ec0563bcea31a622a1dfcd526591d31b0b1363df370f501452a5357fba6e64f"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
