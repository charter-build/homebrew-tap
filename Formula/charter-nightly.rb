# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.49.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.49.1/charter-0.49.1-darwin-arm64.tar.gz"
      sha256 "c8a69c7a022ec4a0fdef3e125f4fb725d57fd71a94f69410df588d2da7cb01b8"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.49.1/charter-0.49.1-darwin-arm64.tar.gz"
        sha256 "c8a69c7a022ec4a0fdef3e125f4fb725d57fd71a94f69410df588d2da7cb01b8"
      else
        url "https://releases.charter.build/cli/nightly/0.49.1/charter-0.49.1-darwin-x64.tar.gz"
        sha256 "18acda1a22a140b24d272d10703f274abb03ea4915444f33b903297229ff9d84"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.49.1/charter-0.49.1-linux-arm64.tar.gz"
      sha256 "d15075ea013dff4e20d7a87fec8d7e37364d345f1be83c30279b02d76b248b31"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.49.1/charter-0.49.1-linux-x64.tar.gz"
      sha256 "86d00a778458d1019c16ee607e73cb9fc0bba23fa2b40893c7e0a97adddf7dbd"
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
