# homebrew-openfirma

Homebrew tap for [OpenFirma](https://github.com/Firma-AI/openfirma) — a governed
runtime for AI agents.

## Install

```bash
brew tap Firma-AI/openfirma
brew install firma
```

One-liner without explicit tap step:

```bash
brew install Firma-AI/openfirma/firma
```

## Supported platforms

| OS    | Architecture | Release target               |
| ----- | ------------ | ---------------------------- |
| macOS | arm64        | `aarch64-apple-darwin`       |
| macOS | x86_64       | `x86_64-apple-darwin`        |
| Linux | arm64        | `aarch64-unknown-linux-musl` |
| Linux | x86_64       | `x86_64-unknown-linux-musl`  |

Linux builds are statically linked against musl. Windows is not distributed via
this tap — use the upstream installer instead.

## Verify

```bash
firma --version
firma --help
```

## Upgrade

```bash
brew update
brew upgrade firma
```

## Uninstall

```bash
brew uninstall firma
brew untap Firma-AI/openfirma
```

## Updating the formula

`Formula/firma.rb` pins one `version`, four release URLs, and four SHA-256
digests (one per target triple). Every release bump must update all five
fields. The digests come from the `firma-<version>-<target>.tar.gz.sha256`
sidecar files attached to the GitHub release.

Fast path with [`brew bump-formula-pr`](https://docs.brew.sh/Manpage#bump-formula-pr):

```bash
brew bump-formula-pr \
  --tap=Firma-AI/openfirma \
  --version=<new-version> \
  firma
```

## License

[The Unlicense](./LICENSE). The formula text is public domain; the upstream
`firma` binary is licensed separately under Apache-2.0.
