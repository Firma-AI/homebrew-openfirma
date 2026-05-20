# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## What this repo is

Homebrew tap for the `firma` CLI shipped by
[Firma-AI/openfirma](https://github.com/Firma-AI/openfirma). It contains a
single Homebrew formula (`Formula/firma.rb`) that downloads prebuilt release
tarballs from the upstream repo's GitHub Releases and installs the `firma`
binary.

This tap does **not** build from source. It only consumes binary release
artifacts. Source builds live in the upstream `openfirma` repo.

## Layout

```text
Formula/firma.rb          # the single formula
README.md                 # user-facing install docs
LICENSE                   # The Unlicense (tap text only; firma is Apache-2.0)
.github/workflows/        # CI: brew audit + brew install on Linux/macOS
```

## Release artifacts the formula expects

Upstream releases tag `vX.Y.Z` and attach, per target triple, a tarball and a
matching `.sha256` file:

```text
firma-<version>-aarch64-apple-darwin.tar.gz
firma-<version>-x86_64-apple-darwin.tar.gz
firma-<version>-aarch64-unknown-linux-musl.tar.gz
firma-<version>-x86_64-unknown-linux-musl.tar.gz
```

Each tarball contains a single top-level `firma` executable. The formula's
`install` block does `bin.install "firma"`. If upstream changes the archive
layout (e.g. adds a top-level directory or extra files), update `install`
accordingly.

## Bumping the formula version

Update five fields in `Formula/firma.rb`:

1. `version`
2. Four `sha256` values (macOS arm64, macOS x86_64, Linux arm64, Linux x86_64)

The URLs interpolate `#{version}` and need no per-bump edit unless the upstream
naming scheme changes.

The fastest path is `brew bump-formula-pr` (see README). Manual flow:

```bash
VERSION=<new-version>
for target in aarch64-apple-darwin x86_64-apple-darwin \
              aarch64-unknown-linux-musl x86_64-unknown-linux-musl; do
  curl -fsSL "https://github.com/Firma-AI/openfirma/releases/download/v${VERSION}/firma-${VERSION}-${target}.tar.gz.sha256"
done
```

## Local validation

```bash
brew style ./Formula/firma.rb
brew audit --strict --formula ./Formula/firma.rb
brew install --formula --verbose ./Formula/firma.rb
firma --version
```

`brew audit --strict` is what CI runs; keep it green.

## CI

`.github/workflows/tests.yml` has two jobs:

- `brew-audit` — symlinks the checkout as a Homebrew tap and runs `brew style`
  plus `brew audit --strict --tap Firma-AI/openfirma`. Runs on every PR and
  push to `main`.
- `brew-install` — installs the formula and runs `brew test` on macOS arm64,
  macOS x86_64, and Linux x86_64. **Currently gated by `if: false`** because
  the upstream `Firma-AI/openfirma` repository is private and Homebrew cannot
  download its release assets without a custom download strategy. Flip the
  gate once upstream goes public, or land a
  `GitHubPrivateRepositoryReleaseDownloadStrategy` in the formula.

Pull requests must keep `brew-audit` green before merging.

## Conventions

- All third-party GitHub Actions are pinned by full commit SHA with a trailing
  comment for the human-readable version (ZIZMOR-UNPINNED-USES).
- Top-level workflow `permissions:` is `contents: read`; never grant more
  unless a specific job needs it.
- Markdown follows `markdownlint` defaults (ATX headings, blank lines around
  blocks/lists, trailing newline). Tables use the aligned style.
- The formula is Ruby; follow `brew style` output. Two-space indent, no
  trailing whitespace.

## What NOT to do here

- Do not vendor source code. The tap installs binaries only.
- Do not add a `head` block that builds from `main`. Upstream owns source
  builds.
- Do not add bottles. The release tarballs already ship per-target binaries;
  bottling on top would double-host artifacts.
- Do not add unrelated formulae. This tap exists only for `firma`.

## Upstream

- Source: <https://github.com/Firma-AI/openfirma>
- Releases: <https://github.com/Firma-AI/openfirma/releases>
- Install script (reference for target triples and archive naming):
  `install.sh` in the upstream repo.
