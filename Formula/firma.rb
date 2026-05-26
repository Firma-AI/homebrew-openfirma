class Firma < Formula
  desc "Governed runtime for AI agents"
  homepage "https://github.com/Firma-AI/openfirma"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.0/firma-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "REPLACE_AFTER_RELEASE"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.0/firma-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "REPLACE_AFTER_RELEASE"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.0/firma-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "REPLACE_AFTER_RELEASE"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.0/firma-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "REPLACE_AFTER_RELEASE"
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
