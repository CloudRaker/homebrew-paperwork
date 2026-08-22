class Paperwork < Formula
  desc "CLI for the CloudRaker Paperwork API"
  homepage "https://paperwork.sh"
  version "0.0.3"

  # Prebuilt archives live in R2 (https://release.paperwork.sh), not GitHub
  # releases. Keys: cli/<semver>/paperwork-<rust-target>.tar.gz
  on_macos do
    on_arm do
      url "https://release.paperwork.sh/cli/0.0.3/paperwork-aarch64-apple-darwin.tar.gz"
      sha256 "cedbcb5ee1ff97fdf1b7d67a5280e0ffea7ea2ca027f95416d06e2886f2967ab"
    end
    on_intel do
      url "https://release.paperwork.sh/cli/0.0.3/paperwork-x86_64-apple-darwin.tar.gz"
      sha256 "199a7af830ed82ef8e0fc5484ab2c6594de429810ca9dbc54d6ead50d3d05e07"
    end
  end

  on_linux do
    on_arm do
      url "https://release.paperwork.sh/cli/0.0.3/paperwork-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e46e8acfad818f777826f0aff37a169902f51d0ecd77e2b5ce81e04abb210cfa"
    end
    on_intel do
      url "https://release.paperwork.sh/cli/0.0.3/paperwork-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a9359257d32f7f6a6175d659cb856f7bc2e437a838a431cc2a9091b5eeb0c7b1"
    end
  end

  def install
    bin.install "paperwork"
  end

  test do
    assert_match "paperwork #{version}", shell_output("#{bin}/paperwork --version")
  end
end
