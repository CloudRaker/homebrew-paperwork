class Paperwork < Formula
  desc "CLI for the CloudRaker Paperwork API"
  homepage "https://paperwork.sh"
  version "0.0.1"

  # Prebuilt archives live in R2 (https://release.paperwork.sh), not GitHub
  # releases. Keys: cli/<semver>/paperwork-<rust-target>.tar.gz
  on_macos do
    on_arm do
      url "https://release.paperwork.sh/cli/0.0.1/paperwork-aarch64-apple-darwin.tar.gz"
      sha256 "7c907eb8eaf5a69f1a2251463cb29887e41eb62ebcdb88b0f4a6dbbef97e36e4"
    end
    on_intel do
      url "https://release.paperwork.sh/cli/0.0.1/paperwork-x86_64-apple-darwin.tar.gz"
      sha256 "7455dd5f2ac06f0f0ece834e8996d1b4d162e4b77b8ac1aa0e80321beacb5a85"
    end
  end

  on_linux do
    on_arm do
      url "https://release.paperwork.sh/cli/0.0.1/paperwork-aarch64-unknown-linux-musl.tar.gz"
      sha256 "90fc96a81f83771812820e10755bab2c5000e40181120f4fd9c6e25d62db1583"
    end
    on_intel do
      url "https://release.paperwork.sh/cli/0.0.1/paperwork-x86_64-unknown-linux-musl.tar.gz"
      sha256 "92455bdf93b96a5fcf038f358538df8da81286d37c987e1a52c7a1b29fc2dffd"
    end
  end

  def install
    bin.install "paperwork"
  end

  test do
    assert_match "paperwork #{version}", shell_output("#{bin}/paperwork --version")
  end
end
