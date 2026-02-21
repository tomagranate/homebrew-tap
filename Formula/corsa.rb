class Corsa < Formula
  desc "TUI dashboard for managing local dev processes"
  homepage "https://github.com/tomagranate/corsa"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-darwin-arm64.tar.gz"
      sha256 "ca25145cbaf4cf3c1cd67631ce8781858231ef914cd1d593b270596a0c097d66"

      def install
        bin.install "corsa-darwin-arm64" => "corsa"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-darwin-x64.tar.gz"
      sha256 "6bb55307fe8fc81bdc68c094ef1b3f9ce217aa541d282eb54d3deca04e438032"

      def install
        bin.install "corsa-darwin-x64" => "corsa"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-linux-arm64.tar.gz"
      sha256 "062538f708167fa210a3522b0b9793f6b015cf60c5485a27d19e45982de5cbad"

      def install
        bin.install "corsa-linux-arm64" => "corsa"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-linux-x64.tar.gz"
      sha256 "29b9307e9ac4c1c463ba39697c5269b795ea20fca74f742d21e5fc5b9ecab3db"

      def install
        bin.install "corsa-linux-x64" => "corsa"
      end
    end
  end

  test do
    assert_match "corsa", shell_output("#{bin}/corsa --help")
  end
end
