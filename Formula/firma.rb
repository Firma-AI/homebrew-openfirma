class Firma < Formula
  desc "Governed runtime for AI agents"
  homepage "https://github.com/Firma-AI/openfirma"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.0/firma-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "4063f7af7c59f8c8d0c5325984adb9780a6093ebe6aed073afa333e25c160595"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.0/firma-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "676394996ba32515e2b623f4ec63787cda27ff3cf157eb847bf6cf344f96b6ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.0/firma-0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a2fff47cd800ce0b5ee2325da4b8378223f8753a6aaaffacc7866ae17e679a39"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.0/firma-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "33a5a5174218e09a51bb88fd85d179643341288c5078912873f7ee743c2a5677"
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
