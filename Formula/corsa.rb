class Corsa < Formula
  desc "TUI dashboard for managing local dev processes"
  homepage "https://github.com/tomagranate/corsa"
  version "1.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-darwin-arm64.tar.gz"
      sha256 "e40398e446a4e2b0ceb25d3933c874d1c975b0d6b04c31643c09f2457d3ab5f7"

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
      sha256 "f38c1cafa029ba7e6941957a1fe6d6dfee48e67c6afc40c6e9951d8b46b8e244"

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
      sha256 "1aaef710a743695f857bc8023640b0befc13a213c507db48a0b1f28bb12064e0"

      def install
        bin.install "corsa-linux-arm64" => "corsa"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-linux-x64.tar.gz"
      sha256 "d1042f72a0846c107ca732601d15b1ca73e648df63e240de1c98cb08a78a1b51"

      def install
        bin.install "corsa-linux-x64" => "corsa"
      end
    end
  end

  test do
    assert_match "corsa", shell_output("#{bin}/corsa --version")
  end
end
