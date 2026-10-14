# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.33.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.33.1/charter-0.33.1-darwin-arm64.tar.gz"
      sha256 "ccc7fa9cc9d56da21980df10bd8d2c07c3848265804bed5bb9685ad57f7f8362"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.33.1/charter-0.33.1-darwin-arm64.tar.gz"
        sha256 "ccc7fa9cc9d56da21980df10bd8d2c07c3848265804bed5bb9685ad57f7f8362"
      else
        url "https://releases.charter.build/cli/nightly/0.33.1/charter-0.33.1-darwin-x64.tar.gz"
        sha256 "aa4754d0f1d208ca3f12cf5d963c07c00d3c0f785043033b3b80c3652cb6a89f"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.33.1/charter-0.33.1-linux-arm64.tar.gz"
      sha256 "43505e2f1fea6418ae8b27d221837981a59ae35f0c6a5181c4dabca5620a86e8"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.33.1/charter-0.33.1-linux-x64.tar.gz"
      sha256 "ddd444b65e69ee437ac73aceda0dd219df89f530ea8ad750ccb2f0619c4e68e1"
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
