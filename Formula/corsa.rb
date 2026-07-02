class Corsa < Formula
  desc "TUI dashboard for managing local dev processes"
  homepage "https://github.com/tomagranate/corsa"
  version "1.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-darwin-arm64.tar.gz"
      sha256 "d27af7069eabf275050dbb9736a027a3898c26cce825a8bd545b949412ca9b33"

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
      sha256 "f5ca195f8ac0f8c388859f2a01c0637c6b5955d6e2df1984d02331ad5f34d00e"

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
      sha256 "ffe5dff89960e1fdc0f1de707a721b26e110d3793b0dc820b54fbfafcf96b917"

      def install
        bin.install "corsa-linux-arm64" => "corsa"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-linux-x64.tar.gz"
      sha256 "1cda4feb3b05aa39a84664837d1b311686b6f3a6c8a052008856698c1b06b933"

      def install
        bin.install "corsa-linux-x64" => "corsa"
      end
    end
  end

  test do
    assert_match "corsa", shell_output("#{bin}/corsa --version")
  end
end
