class Corsa < Formula
  desc "TUI dashboard for managing local dev processes"
  homepage "https://github.com/tomagranate/corsa"
  version "1.2.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-darwin-arm64.tar.gz"
      sha256 "771f66907d321a1bbac3f1c8c966d7d6906e2f09226ad985ba494373cb0a0844"

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
      sha256 "8b451c9543eb95b4f2336d19bc85e14805d977d179b2ad66a5b09dd4255b4601"

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
      sha256 "dd0f8d3704fd4a6bf61d7a5fce9622cca56aba58b9a677eed87f56cfe3f5b540"

      def install
        bin.install "corsa-linux-arm64" => "corsa"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-linux-x64.tar.gz"
      sha256 "3523042d044c472f19e44748531495211ef9625b8b1c5b4b80568030a3af5fd1"

      def install
        bin.install "corsa-linux-x64" => "corsa"
      end
    end
  end

  test do
    assert_match "corsa", shell_output("#{bin}/corsa --version")
  end
end
