class Paperwork < Formula
  desc "CLI for the CloudRaker Paperwork API"
  homepage "https://paperwork.sh"

  # Prebuilt archives live in R2 (https://release.paperwork.sh), not GitHub
  # releases. Keys: cli/<semver>/paperwork-<rust-target>.tar.gz
  #
  # Homebrew reads the version from the URL, but misreads x86_64 targets
  # ("64-unknown-linux-musl"), so those carry an explicit version. aarch64 must
  # not: `brew audit` rejects it as redundant. The sync workflow updates all.
  on_macos do
    on_arm do
      url "https://release.paperwork.sh/cli/0.0.8/paperwork-aarch64-apple-darwin.tar.gz"
      sha256 "544c94bdb112c11435a6c5114529f8089c4447af122899804415c7d07dc45994"
    end
    on_intel do
      version "0.0.8"
      url "https://release.paperwork.sh/cli/0.0.8/paperwork-x86_64-apple-darwin.tar.gz"
      sha256 "15ab6e06b7403d78d20057ab3a612d9fb254ce21353602f4c9e37b994b63f4e8"
    end
  end

  on_linux do
    on_arm do
      url "https://release.paperwork.sh/cli/0.0.8/paperwork-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6796a097302616277eafc628a758506df7564c9d7fc7f2d4c29f0c8836ad86e0"
    end
    on_intel do
      version "0.0.8"
      url "https://release.paperwork.sh/cli/0.0.8/paperwork-x86_64-unknown-linux-musl.tar.gz"
      sha256 "92a67aa2c6066d0e3992093fc46ae8f6c8380734ddb727edaadad6d2147c3539"
    end
  end

  def install
    bin.install "paperwork"
  end

  def caveats
    manual = "#{Dir.home}/.local/bin/paperwork"
    return unless File.exist?(manual)

    <<~EOS
      A copy from the shell installer exists at #{manual}.
      It shadows or is shadowed by this one, depending on PATH. Remove it:
        rm #{manual}
    EOS
  end

  test do
    assert_match "paperwork #{version}", shell_output("#{bin}/paperwork --version")
  end
end
