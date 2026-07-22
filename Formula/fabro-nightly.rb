class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.302.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.302.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "e5a20c9fbd24094fa43082c47be910716d38c2699cfb7c79ea49f1ec11006a19"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.302.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ff63ba57fa8b79de91276cf233ceae96f1847f480501d9227980c34b3252afd"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.302.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f09ac9e568d5b468fac9693d668fb765d7ea39430e0389fbcb35836c303e671"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
