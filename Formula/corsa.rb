class Corsa < Formula
  desc "TUI dashboard for managing local dev processes"
  homepage "https://github.com/tomagranate/corsa"
  version "1.2.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-darwin-arm64.tar.gz"
      sha256 "e896fb7a4908e348e56635ed4089df1b64ab7db423538e8a1c9adb5088b9319b"

      def install
        bin.install "corsa-darwin-arm64" => "corsa"
        # Bun --compile ships LC_CODE_SIGNATURE that Apple's codesign rejects; macOS may
        # SIGKILL before the app runs. Releases are re-signed in CI; this fixes existing tarballs.
        ohai "Applying ad-hoc code signature for macOS compatibility"
        quiet_system "/usr/bin/codesign", "--remove-signature", bin/"corsa"
        system "/usr/bin/codesign", "-s", "-", "--force", "--timestamp=none", bin/"corsa"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-darwin-x64.tar.gz"
      sha256 "f6ec45d476617c69c2c14e7e6bd4185a88b52d40c1fac01532dfe3eb1d82f0ca"

      def install
        bin.install "corsa-darwin-x64" => "corsa"
        ohai "Applying ad-hoc code signature for macOS compatibility"
        quiet_system "/usr/bin/codesign", "--remove-signature", bin/"corsa"
        system "/usr/bin/codesign", "-s", "-", "--force", "--timestamp=none", bin/"corsa"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-linux-arm64.tar.gz"
      sha256 "3a533114c8147aca253a168e7b82218be09a745236c2736ac7a5d116779a890d"

      def install
        bin.install "corsa-linux-arm64" => "corsa"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-linux-x64.tar.gz"
      sha256 "1d3429081f321e216bbdb1d40f35f57c059c7d6fab2688bc48f377aa5a0431d9"

      def install
        bin.install "corsa-linux-x64" => "corsa"
      end
    end
  end

  test do
    assert_match "corsa", shell_output("#{bin}/corsa --version")
  end
end
