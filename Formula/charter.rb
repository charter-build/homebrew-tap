# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class Charter < Formula
  desc "Command-line access to Charter workspaces (stable channel)"
  homepage "https://charter.build"
  version "0.40.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.40.1/charter-0.40.1-darwin-arm64.tar.gz"
      sha256 "c7e55f69db589473f5b783cf540f7bdc7956a9f9aad11ea540350c8052af8576"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.40.1/charter-0.40.1-darwin-arm64.tar.gz"
        sha256 "c7e55f69db589473f5b783cf540f7bdc7956a9f9aad11ea540350c8052af8576"
      else
        url "https://releases.charter.build/cli/nightly/0.40.1/charter-0.40.1-darwin-x64.tar.gz"
        sha256 "f570e844c78f183149d30ab3fb9a7c64e3729ab53bfcf057552ab7fe6292b353"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.40.1/charter-0.40.1-linux-arm64.tar.gz"
      sha256 "2524e0d6d24cd03aa8d7ef50eceff63eeaeb860eb973874b3c4fc995e85f51a4"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.40.1/charter-0.40.1-linux-x64.tar.gz"
      sha256 "afd4c780d8847e8fe6749147fc3d75afe9d116ddae6345b9f8d65bacbaf686da"
    end
  end

  conflicts_with "charter-build/tap/charter-nightly", because: "every channel installs the charter command"

  def install
    bin.install "charter"
    (libexec/"channel").write "stable\n"
  end

  test do
    system bin/"charter", "--version"
  end
end
