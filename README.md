# homebrew-tap

A Homebrew tap for installing tools by [tomagranate](https://github.com/tomagranate).

## Available Formulas

| Formula | Description |
|---------|-------------|
| [toolui](https://github.com/tomagranate/toolui) | Terminal UI for running multiple local dev servers simultaneously |

## Installation

Install a formula directly:

```bash
brew install tomagranate/tap/toolui
```

Or add the tap first, then install by name:

```bash
brew tap tomagranate/tap
brew install toolui
```

## How It Works

This tap uses automated formula updates. When a new version of a package is released:

1. The source repository's release workflow triggers a `repository_dispatch` event to this tap
2. The `update-formula` workflow downloads the new release artifacts
3. SHA256 checksums are computed for each platform binary
4. The formula is updated with the new version and checksums
5. Changes are automatically committed and pushed

This means Homebrew users get access to new versions shortly after release without any manual intervention.

## Manual Updates

The formula can also be updated manually via workflow dispatch if needed—provide the formula name and version number (without the `v` prefix).
