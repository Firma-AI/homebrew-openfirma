# Homebrew tap for OpenFirma

```bash
brew install firma-ai/openfirma/firma
```

## Maintainer notes

After publishing a new GitHub Release in [`Firma-AI/openfirma`](https://github.com/Firma-AI/openfirma),
regenerate `Formula/firma.rb` from the openfirma checkout:

```bash
./scripts/update-homebrew-tap.sh 0.1.0 ../homebrew-openfirma
```

The release workflow in openfirma can also push this automatically when
`HOMEBREW_TAP_TOKEN` is configured.
