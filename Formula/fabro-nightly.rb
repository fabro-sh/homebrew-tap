class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.309.0-nightly.2"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.309.0-nightly.2/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "3386c9e3a1fd4a98854a688fe87064bb9c66d1b0617244ebd623ca3a0d388d47"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.309.0-nightly.2/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ae13e3c6c15bfe37a524f9ad82bb1d7808a88052a4e92212cc36dd022993bfc4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.309.0-nightly.2/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "493b7bb140d92871ede32d85b92bae8711f80775fa27f00ee8f4082f01b8eed6"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
