class Corsa < Formula
  desc "TUI dashboard for managing local dev processes"
  homepage "https://github.com/tomagranate/corsa"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-darwin-arm64.tar.gz"
      sha256 "3a76e038fdbb4d6768efca6a9f212f26a992d631e0cc28228d683563356306fc"

      def install
        bin.install "corsa-darwin-arm64" => "corsa"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-darwin-x64.tar.gz"
      sha256 "d3ef48f325919bbe31d085e59c0e64ae823b63dcc4a9cdcd9c20e342760f9eb4"

      def install
        bin.install "corsa-darwin-x64" => "corsa"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-linux-arm64.tar.gz"
      sha256 "d3552817ed9cfd54059259a8726a6c60f4c0b294c55653d8c16e30e165d92480"

      def install
        bin.install "corsa-linux-arm64" => "corsa"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-linux-x64.tar.gz"
      sha256 "428d4dd1b861e2d6d9a7213bdcfddfd78aac87dbb60f3ed22e2f0af945121027"

      def install
        bin.install "corsa-linux-x64" => "corsa"
      end
    end
  end

  test do
    assert_match "corsa", shell_output("#{bin}/corsa --help")
  end
end
