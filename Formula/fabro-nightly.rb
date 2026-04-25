class FabroNightly < Formula
  desc "Unified CLI for the Fabro AI framework (nightly channel)"
  homepage "https://fabro.sh"
  license "MIT"
  version "0.214.0-nightly.0"

  conflicts_with "fabro", because: "both install the fabro binary"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.214.0-nightly.0/fabro-aarch64-apple-darwin.tar.gz"
      sha256 "d7d4a5225ac5c34dc138395b9fe0c1cac23f16145e5f48d3d3194238492ba6a2"
    end
  end

  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.214.0-nightly.0/fabro-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09b8b92757eda03352da4a4d56db2414015e391b2a98a6c5c9f1b138c526c831"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fabro-sh/fabro/releases/download/v0.214.0-nightly.0/fabro-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "778876facfac11b2689024dd8bcaf0cb0693f878de0aa4ebcd6da7c9c0be96ef"
    end
  end

  def install
    bin.install "fabro"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fabro --version")
  end
end
