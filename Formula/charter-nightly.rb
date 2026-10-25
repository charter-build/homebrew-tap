# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.41.3"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.41.3/charter-0.41.3-darwin-arm64.tar.gz"
      sha256 "6fed690859fce3b9b8c70eec932571011892e868e1014b54eb77519c76dfbe17"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.41.3/charter-0.41.3-darwin-arm64.tar.gz"
        sha256 "6fed690859fce3b9b8c70eec932571011892e868e1014b54eb77519c76dfbe17"
      else
        url "https://releases.charter.build/cli/nightly/0.41.3/charter-0.41.3-darwin-x64.tar.gz"
        sha256 "e53ad0ae426c08dd5d06c4b8356efea2a77e5256601c8b30b90712fd658fab6f"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.41.3/charter-0.41.3-linux-arm64.tar.gz"
      sha256 "b9c0513ffc5706f8b34e050e76070aef0e797ed552c8578d1c5acc6c96c871fa"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.41.3/charter-0.41.3-linux-x64.tar.gz"
      sha256 "77008e5f04c2727d75436fb850f1f8a72858a47201cf20a1aae12a7a9ebeb56f"
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
