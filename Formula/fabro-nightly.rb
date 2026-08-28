class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.339.0-nightly.1"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.339.0-nightly.1/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "7abdb086e45cee95b251c22ef03638e6ea4781f936eeafed1b1a8d792847b2de"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.339.0-nightly.1/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ef907b286821cce51030268977d7dc876630cec519515db4e8ebead43c80f88"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.339.0-nightly.1/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca3483fd7096917780c7477d2eeef9bafc4e8b52d1f0c9e9493ddb55487cdad3"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
