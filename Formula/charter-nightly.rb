# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.32.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.32.1/charter-0.32.1-darwin-arm64.tar.gz"
      sha256 "77ff603342325cfa303504e0d6a07316e9d3059c619a7d6d56dbd3a156e820d8"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.32.1/charter-0.32.1-darwin-arm64.tar.gz"
        sha256 "77ff603342325cfa303504e0d6a07316e9d3059c619a7d6d56dbd3a156e820d8"
      else
        url "https://releases.charter.build/cli/nightly/0.32.1/charter-0.32.1-darwin-x64.tar.gz"
        sha256 "8ced19ac5117647053e8c0357ac60a2ce2a696bb2d7e248c009c7012d3c28397"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.32.1/charter-0.32.1-linux-arm64.tar.gz"
      sha256 "393c12683062586ea78c121e2190fd5d22e6137835d981c6cd3c92391c01aa1d"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.32.1/charter-0.32.1-linux-x64.tar.gz"
      sha256 "44600e6108f2f0a13005e1d0aa1692298933a0fb5beecf151f0b4389c81691a9"
    end
  end

  conflicts_with "charter-build/tap/charter", because: "every channel installs the charter command"

  def install
    bin.install "charter"
    (libexec/"channel").write "nightly\n"
  end

  test do
    system bin/"charter", "--version"
  end
end
