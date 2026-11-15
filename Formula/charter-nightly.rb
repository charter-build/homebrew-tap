# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.46.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.46.1/charter-0.46.1-darwin-arm64.tar.gz"
      sha256 "f82fd6020c60cbf9707c55ae1aa59f3868c4ed40bdd7f19f9ed62e8ba353d0f0"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.46.1/charter-0.46.1-darwin-arm64.tar.gz"
        sha256 "f82fd6020c60cbf9707c55ae1aa59f3868c4ed40bdd7f19f9ed62e8ba353d0f0"
      else
        url "https://releases.charter.build/cli/nightly/0.46.1/charter-0.46.1-darwin-x64.tar.gz"
        sha256 "8d91c99a72a857b7c868311fd798cc4247dc73b8fcb762b3bada36e3c8cfb76b"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.46.1/charter-0.46.1-linux-arm64.tar.gz"
      sha256 "fc3a9aecee28bd61526ca75acd195a98f67b405e799cc8bcfa47f524cd80988f"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.46.1/charter-0.46.1-linux-x64.tar.gz"
      sha256 "dc84aafe17f61533ca1ecf8c603e2b666f02267d8dc4096c7df1cc536b561fd9"
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
