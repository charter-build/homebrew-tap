# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.45.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.45.1/charter-0.45.1-darwin-arm64.tar.gz"
      sha256 "0a817bb71544ccc48d630ab8889a68eff32b2ae278e874cf66fceb4523ec6eab"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.45.1/charter-0.45.1-darwin-arm64.tar.gz"
        sha256 "0a817bb71544ccc48d630ab8889a68eff32b2ae278e874cf66fceb4523ec6eab"
      else
        url "https://releases.charter.build/cli/nightly/0.45.1/charter-0.45.1-darwin-x64.tar.gz"
        sha256 "b8f781e942ad2e9ee8babfe3fb03997f444b2fdddb954fabdf02ddd1eccdc576"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.45.1/charter-0.45.1-linux-arm64.tar.gz"
      sha256 "cedea429a08a082038917553b54b2eab3534afd6a243bf4731a1ddbaa05dab95"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.45.1/charter-0.45.1-linux-x64.tar.gz"
      sha256 "526e52e67d89621bacdd4030ad3cf6785abf2ece8d820ca83e3974be5f0ab10b"
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
