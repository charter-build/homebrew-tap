# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.48.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.48.1/charter-0.48.1-darwin-arm64.tar.gz"
      sha256 "36c661401f214757dde3bfefd0c1a5fe081b0ca9767afb344bcea217293bc637"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.48.1/charter-0.48.1-darwin-arm64.tar.gz"
        sha256 "36c661401f214757dde3bfefd0c1a5fe081b0ca9767afb344bcea217293bc637"
      else
        url "https://releases.charter.build/cli/nightly/0.48.1/charter-0.48.1-darwin-x64.tar.gz"
        sha256 "ec51fdbe3d013990e3049a5413f6b8423fd3b7800870723c39fee321c64198c4"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.48.1/charter-0.48.1-linux-arm64.tar.gz"
      sha256 "3c333c68a4aaa89eb01e3f0e082717260bfdd663db743f9703cca809b79d76a1"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.48.1/charter-0.48.1-linux-x64.tar.gz"
      sha256 "dbccdcfdf65da06a9707ae0a0301b6c68db9455444db421a2c1dd1600fa2af4c"
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
