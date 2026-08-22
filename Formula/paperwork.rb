class Paperwork < Formula
  desc "CLI for the CloudRaker Paperwork API"
  homepage "https://paperwork.sh"
  version "0.0.4"

  # Prebuilt archives live in R2 (https://release.paperwork.sh), not GitHub
  # releases. Keys: cli/<semver>/paperwork-<rust-target>.tar.gz
  on_macos do
    on_arm do
      url "https://release.paperwork.sh/cli/0.0.4/paperwork-aarch64-apple-darwin.tar.gz"
      sha256 "95157999f2688fbc902832dd37c3ed07d34d4ed3fd98e1383b1b59b9943344e6"
    end
    on_intel do
      url "https://release.paperwork.sh/cli/0.0.4/paperwork-x86_64-apple-darwin.tar.gz"
      sha256 "dc3e983bed67bbe4ae22731a283d228466b8f0df5786d32179290f038b8ae16f"
    end
  end

  on_linux do
    on_arm do
      url "https://release.paperwork.sh/cli/0.0.4/paperwork-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8aa5c9288bbd1a8ce763479773b9605878725ab2cba024442b7b0940290c8de5"
    end
    on_intel do
      url "https://release.paperwork.sh/cli/0.0.4/paperwork-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4e4ca31d42aae38f29cb405b6a5eebbd9a21c962657e060ff805ab182af4a6d2"
    end
  end

  def install
    bin.install "paperwork"
  end

  test do
    assert_match "paperwork #{version}", shell_output("#{bin}/paperwork --version")
  end
end
