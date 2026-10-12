# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class Charter < Formula
  desc "Command-line access to Charter workspaces (stable channel)"
  homepage "https://charter.build"
  version "0.30.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.30.1/charter-0.30.1-darwin-arm64.tar.gz"
      sha256 "9175ec8189eaff5afa49c1e9ba654c0314890248e3dbb56fdc5d168f65bb9f6b"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.30.1/charter-0.30.1-darwin-arm64.tar.gz"
        sha256 "9175ec8189eaff5afa49c1e9ba654c0314890248e3dbb56fdc5d168f65bb9f6b"
      else
        url "https://releases.charter.build/cli/nightly/0.30.1/charter-0.30.1-darwin-x64.tar.gz"
        sha256 "644a6b88d2cdfb268ba88963431bc94d46f80563b78f88b50c4e7411a16cdc24"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.30.1/charter-0.30.1-linux-arm64.tar.gz"
      sha256 "f030fbfe47a9b95143ee67553447208927117b2b4c5556b3dda4a9590f62c3f3"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.30.1/charter-0.30.1-linux-x64.tar.gz"
      sha256 "a5d8712ef1bd7c0697455d97fe3416fc40f837561e0152402b97ba3b4fd7a084"
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
