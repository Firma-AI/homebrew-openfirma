class Firma < Formula
  desc "Firma CLI for managing and running OpenFirma components"
  homepage "https://openfirma.ai"
  version "0.1.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.6/firma-aarch64-apple-darwin.tar.gz"
      sha256 "2782a459bb62371959d4664787429fce3e25199ea348221c5f721e4c034d7946"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.6/firma-x86_64-apple-darwin.tar.gz"
      sha256 "ca0b1d8764881cf1021043200161571062e12eda5739fa0fef6096c9b60aba24"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.6/firma-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0a1597915e8f3b432c83f6123dac5fa0d549967ad4814520c97ee0ff924f8ea8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Firma-AI/openfirma/releases/download/v0.1.6/firma-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0c14ed8cf485cc3ba0aada80d53191eb3c17a9bb35d5469b567f975cdada5849"
    end
  end
  license "GPL-3.0-only"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {},
    "aarch64-pc-windows-gnu":             {},
    "aarch64-unknown-linux-gnu":          {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static":  {},
    "x86_64-apple-darwin":                {},
    "x86_64-pc-windows-gnu":              {},
    "x86_64-unknown-linux-gnu":           {},
    "x86_64-unknown-linux-musl-dynamic":  {},
    "x86_64-unknown-linux-musl-static":   {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "firma" if OS.mac? && Hardware::CPU.arm?
    bin.install "firma" if OS.mac? && Hardware::CPU.intel?
    bin.install "firma" if OS.linux? && Hardware::CPU.arm?
    bin.install "firma" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
