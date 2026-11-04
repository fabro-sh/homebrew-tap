class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.407.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.407.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "d43f27ab7d1087d977caf5c87d46d5f4339846fb339b64eaa7fa1ac16da9728a"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.407.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6dd481ef72dc7a208481d112dcfa979199365ffcc10fd693d0986e49ed0c103a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.407.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b23b8b75a8ce1215ea491cd258cb6aa437e7c17e969f998218be6c440137715"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
