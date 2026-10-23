# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.36.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.36.1/charter-0.36.1-darwin-arm64.tar.gz"
      sha256 "460c0a88b7bf74eb32c8442161a0f8a1e660e445a9464f31036b123793e9ba03"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.36.1/charter-0.36.1-darwin-arm64.tar.gz"
        sha256 "460c0a88b7bf74eb32c8442161a0f8a1e660e445a9464f31036b123793e9ba03"
      else
        url "https://releases.charter.build/cli/nightly/0.36.1/charter-0.36.1-darwin-x64.tar.gz"
        sha256 "a2453356a983c2c01cad1e8d11ef3dd40e5b2c0e84502aa0b85da730a19a192b"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.36.1/charter-0.36.1-linux-arm64.tar.gz"
      sha256 "494eb6a54cd0e7838dc80cbd4ee9812d04188b84dee53009d41dade961b23887"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.36.1/charter-0.36.1-linux-x64.tar.gz"
      sha256 "3c860a1befc7f76008402fbaf13975600c8e0231b0aa9ff39b899898bf606c2e"
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
