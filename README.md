# homebrew-tap

A Homebrew tap for installing tools by [tomagranate](https://github.com/tomagranate).

## Available Formulas

| Formula | Description |
|---------|-------------|
| [corsa](https://github.com/tomagranate/corsa) | TUI dashboard for managing local dev processes |

## Installation

Install a formula directly:

```bash
brew install tomagranate/tap/<formula-name>
```

Or add the tap first, then install by name:

```bash
brew tap tomagranate/tap
brew install <formula-name>
```

## How It Works

This tap uses automated formula updates. When a new version of a package is released:

1. The source repository's release workflow triggers a `repository_dispatch` event to this tap
2. The `update-formula` workflow downloads the new release artifacts
3. SHA256 checksums are computed for each platform binary
4. The formula is created (if new) or updated with the new version and checksums
5. The README is automatically regenerated with the current formula list
6. Changes are automatically committed and pushed

This means Homebrew users get access to new versions shortly after release without any manual intervention.

## Adding a New Formula

To add a new formula, trigger the workflow with:
- `formula`: The formula/binary name
- `version`: Version number (without v prefix)
- `repo`: Source repository (e.g., tomagranate/toolui)
- `desc`: Short description (required for new formulas)
- `homepage`: Homepage URL (optional, defaults to GitHub repo)
- `license`: SPDX license identifier (optional, defaults to MIT)

## Manual Updates

The formula can also be updated manually via workflow dispatch if needed—provide the formula name and version number (without the `v` prefix).
