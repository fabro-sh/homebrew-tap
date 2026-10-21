class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.393.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.393.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "be5434d669ca1cc4380692479bf4d3cf11f2aecfdc3a6921cdecdc1dc4bdb46f"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.393.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d49f556cec2212ead1483d8aa3b3939cdc0a4a2be61eebee0e5655fe53c2669"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.393.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "452a65f078f0ebe32acf3967ac65019156977f452d0d54ef29f0613d242a3682"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
