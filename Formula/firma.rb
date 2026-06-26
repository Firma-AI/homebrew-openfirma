class Firma < Formula
  desc "Governed runtime for AI agents"
  homepage "https://github.com/Firma-AI/openfirma"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.2/firma-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "0e58931e017522151de747bc0b79ccb69ee49c25c8c82e47ca850717b57274b3"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.2/firma-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "4f9def2d9abe3c8616654ea02813019fe601294d03403c373854460abd7385ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.2/firma-0.1.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8985faecdf4e1c2291c3e8a15e2fa61cd1f275c3f1309c3822fe1fe76e0fa191"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.2/firma-0.1.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "eeb40cb3e984d582e0ab4dd323d2a6e17b8776e921da81e627f7c6ec7be699dd"
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
