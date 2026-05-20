class Firma < Formula
  desc "Governed runtime for AI agents"
  homepage "https://github.com/Firma-AI/openfirma"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.0.0/firma-0.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "0121c443c87a50ca37f585669a8873447c44772028fcd2fbc7e36891badb0793"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.0.0/firma-0.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "fa681b0268b9be21e514b28a6afccd61c694ec91ed34af3b29ffb9cf03a3967b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.0.0/firma-0.0.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "184158ee50fd2beaa12478f7e67b2f811c173cce5ef431b87a8aaa6a15373a56"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.0.0/firma-0.0.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bf9d24956e70c49842a421684ebe331ede6282dacb7526b074ee2642976d2d3a"
    end
  end

  def install
    bin.install "firma"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/firma --version")
  end
end
