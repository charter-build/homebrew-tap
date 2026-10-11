# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.29.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.29.1/charter-0.29.1-darwin-arm64.tar.gz"
      sha256 "4d0ef6cb22aa44e7075d03c1ab5bdfc3281fba8cb1b0b11831b7ff3f7731193a"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.29.1/charter-0.29.1-darwin-arm64.tar.gz"
        sha256 "4d0ef6cb22aa44e7075d03c1ab5bdfc3281fba8cb1b0b11831b7ff3f7731193a"
      else
        url "https://releases.charter.build/cli/nightly/0.29.1/charter-0.29.1-darwin-x64.tar.gz"
        sha256 "64178e3396aee8d4e363a11bb7192d2fd8e12807d341aec5851c4d47b365cb56"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.29.1/charter-0.29.1-linux-arm64.tar.gz"
      sha256 "a75fe5d49a070da39568817ea48657cb765a85b28c1ab13bd24409be95a6ed99"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.29.1/charter-0.29.1-linux-x64.tar.gz"
      sha256 "25901bae9f7ba96ea9b4c516935e6b0dd9111374851e37c69482d9f86d84c7ec"
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
