class Firma < Formula
  desc "Governed runtime for AI agents"
  homepage "https://github.com/Firma-AI/openfirma"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.5/firma-0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "ec9241c8b96924551df1bd45399f7bfe21fb1aeeefc4637ce583f94296bcdc69"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.5/firma-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "5081663e4c70eb069e91f14277e2071ba39cf91a12b5a31e9d62d689ec291d40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.5/firma-0.1.5-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f3bcfbbfa2fa172e96c54bfd8c876a2da7e7f98c40f8a8a1fca5dc81d14fab82"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.5/firma-0.1.5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "38990c637e39b5b930ff80d459272ea3ffecc8513dae253aed32ebc4f3f73a57"
    end
  end

  def install
    bin.install "firma"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/firma --version")
    assert_match "config", shell_output("#{bin}/firma --help")
  end
end
