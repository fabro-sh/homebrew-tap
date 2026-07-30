class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.310.0-nightly.2"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.310.0-nightly.2/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "af17eea88ef21049578ccd2b7e2ffb1774c1fdffa350ba73f0d98986b466d299"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.310.0-nightly.2/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "247c4a85526a5140b939a64d34e309679051ad6569d1b27df1c80ae9ec69983b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.310.0-nightly.2/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b77d253cfbcdade151995206110205b5717aa51f0257eba7af450ac29468761c"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
