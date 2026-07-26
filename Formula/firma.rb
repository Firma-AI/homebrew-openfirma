class Firma < Formula
  desc "Governed runtime for AI agents"
  homepage "https://github.com/Firma-AI/openfirma"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.4/firma-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "5bf482b0dc3f1cfc82cf5b11dd950b26d90c7675a8789d5c5c0aae4175202ec7"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.4/firma-0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "88c302f94e8208561cd0727b030d87e04505817bf504e70f6872a3efaacc5fb8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.4/firma-0.1.4-aarch64-unknown-linux-musl.tar.gz"
      sha256 "352aff5340b2ba86e8d17a57392fb9d888f8476d63306672b380789f414b2072"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.4/firma-0.1.4-x86_64-unknown-linux-musl.tar.gz"
      sha256 "059879fce621c04b32d4815b4c688773c3d08e377799a5d718bbfba864066dec"
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
