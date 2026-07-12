class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.292.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.292.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "6de5578e0a02abc04162cffdcd0b24ebeff5f1a456b9571232dfc9ed5d58dadb"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.292.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3dd212302b9cb58548a1bc92008a2f86a84cc5be9c81120917931ab001c2ea4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.292.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e91cec43bccd6911bfd62b139126f90375c6715c2439c78e67be54add02d9dcf"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
