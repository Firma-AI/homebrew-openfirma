class Firma < Formula
  desc "Governed runtime for AI agents"
  homepage "https://github.com/Firma-AI/openfirma"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.1/firma-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "e12ebcdf422a227dd45d1f41bb9c6d21033f340fbe0e40960832c28c17efd452"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.1/firma-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "4fb1ff975ee73c97b270e53d8d029faf3d96ec33f19e6729cfea6c78882c869b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.1/firma-0.1.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ac3fe03d1306ee8b103a6c65722198b6ff94eac29513b03015f666cf2fc420b4"
    end
    on_intel do
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.1/firma-0.1.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5fbce897efd56574151a0e158f8b52e8e0f69bcabf85b866ab1745f6616a7043"
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
