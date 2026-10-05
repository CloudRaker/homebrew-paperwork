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
      url "https://release.paperwork.sh/cli/0.0.6/paperwork-aarch64-apple-darwin.tar.gz"
      sha256 "4140bff8300043ec094e637dcce1281a2281f69c09023cdcb22ab83ebfcd8111"
    end
    on_intel do
      version "0.0.6"
      url "https://release.paperwork.sh/cli/0.0.6/paperwork-x86_64-apple-darwin.tar.gz"
      sha256 "3c3e075d220c9dbd30639c125b75400974a8df6685780793e4a979b612421604"
    end
  end

  on_linux do
    on_arm do
      url "https://release.paperwork.sh/cli/0.0.6/paperwork-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dae8fcf651a7ce62fd062a414f3d54ebfd80d2e6ac9eb806606c5492e28fe074"
    end
    on_intel do
      version "0.0.6"
      url "https://release.paperwork.sh/cli/0.0.6/paperwork-x86_64-unknown-linux-musl.tar.gz"
      sha256 "210667fd8e27624e0594c8c3975a017ccbab899587704d1459c72ed28cedfdb2"
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
