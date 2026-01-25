# homebrew-toolui

A Homebrew tap for installing [toolui](https://github.com/tomagranate/toolui).

## Installation

```bash
brew install tomagranate/toolui/toolui
```

Or add the tap first:

```bash
brew tap tomagranate/toolui
brew install toolui
```

## How It Works

This tap uses automated formula updates. When a new version of toolui is released:

1. The main toolui repository's release workflow triggers a `repository_dispatch` event to this tap
2. The `update-formula` workflow downloads the new release artifacts
3. SHA256 checksums are computed for each platform binary
4. The formula is updated with the new version and checksums
5. Changes are automatically committed and pushed

This means Homebrew users get access to new versions shortly after release without any manual intervention.

## Manual Updates

The formula can also be updated manually via workflow dispatch if needed—just provide the version number (without the `v` prefix).
