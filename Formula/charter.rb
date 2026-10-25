# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class Charter < Formula
  desc "Command-line access to Charter workspaces (stable channel)"
  homepage "https://charter.build"
  version "0.39.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.39.1/charter-0.39.1-darwin-arm64.tar.gz"
      sha256 "a0820c14018f7f9910d8c0d5fdc00ea6a75453b3109641b041d35ec89dfe5a36"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.39.1/charter-0.39.1-darwin-arm64.tar.gz"
        sha256 "a0820c14018f7f9910d8c0d5fdc00ea6a75453b3109641b041d35ec89dfe5a36"
      else
        url "https://releases.charter.build/cli/nightly/0.39.1/charter-0.39.1-darwin-x64.tar.gz"
        sha256 "e2867074e619dc084464d59134620c514303f6615292c9cdd91f18364c8d5245"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.39.1/charter-0.39.1-linux-arm64.tar.gz"
      sha256 "171209c76f34c5b7f970270769e6978d8b1fc7e2a7fcc248b43eebeb5b6bb998"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.39.1/charter-0.39.1-linux-x64.tar.gz"
      sha256 "77cf8420c7d1c7aa668dde898ee449d02d8ab11c3a93d7745307ca81c4adb5e1"
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
