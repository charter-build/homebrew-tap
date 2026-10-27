# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.43.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.43.1/charter-0.43.1-darwin-arm64.tar.gz"
      sha256 "01bae8819ee90edb81a1f425639e616d19bb0c00824f6a6501065003b36db38b"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.43.1/charter-0.43.1-darwin-arm64.tar.gz"
        sha256 "01bae8819ee90edb81a1f425639e616d19bb0c00824f6a6501065003b36db38b"
      else
        url "https://releases.charter.build/cli/nightly/0.43.1/charter-0.43.1-darwin-x64.tar.gz"
        sha256 "c9b62452373ab0b2891c7c767f8319395ded664788c3ede6f0998a28a5937205"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.43.1/charter-0.43.1-linux-arm64.tar.gz"
      sha256 "0a9a278fba483651695a22ac4bafe7142fbb79b0946c8d4a8aa3f7e8aa7f979d"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.43.1/charter-0.43.1-linux-x64.tar.gz"
      sha256 "7215ae8fef0fb58eb84927dc442e7565fb37de0fe9fe09393eeb1cf8e3bb6fcf"
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
