# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.38.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.38.1/charter-0.38.1-darwin-arm64.tar.gz"
      sha256 "1501fe15d2aa551844eb5d46775ddb280326cba4a79529d1323e664044b75783"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.38.1/charter-0.38.1-darwin-arm64.tar.gz"
        sha256 "1501fe15d2aa551844eb5d46775ddb280326cba4a79529d1323e664044b75783"
      else
        url "https://releases.charter.build/cli/nightly/0.38.1/charter-0.38.1-darwin-x64.tar.gz"
        sha256 "5ab6ddbdb29516fbc9a96ebb6e40d9bb3092f89beb18eb85ef5a9ed8ffbe3d90"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.38.1/charter-0.38.1-linux-arm64.tar.gz"
      sha256 "1ed46802640cb8bbd6ebf777c41a16af65f9814789fe070eec63d2a918b0f15c"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.38.1/charter-0.38.1-linux-x64.tar.gz"
      sha256 "f4c22651d2602862a10472a66d712bf5f9d051a0000d9aabac21e1dcc025ba2e"
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
