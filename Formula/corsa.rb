class Corsa < Formula
  desc "TUI dashboard for managing local dev processes"
  homepage "https://github.com/tomagranate/corsa"
  version "1.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-darwin-arm64.tar.gz"
      sha256 "cd75618adbbdffbc1abf43e43c5c44c7a0e08d183234216a9f6a0ebcb8f7c487"

      def install
        bin.install "corsa-darwin-arm64" => "corsa"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-darwin-x64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

      def install
        bin.install "corsa-darwin-x64" => "corsa"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-linux-arm64.tar.gz"
      sha256 "7715666e4487e2d056e4bb1caf56e7d1c37790ca34c798c28a392a09a209b7b2"

      def install
        bin.install "corsa-linux-arm64" => "corsa"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/corsa/releases/download/v#{version}/corsa-linux-x64.tar.gz"
      sha256 "b454dc33e9b1d2a9a7db49b5531d872911fb497b74c5af621fe94fbf20198ba3"

      def install
        bin.install "corsa-linux-x64" => "corsa"
      end
    end
  end

  test do
    assert_match "corsa", shell_output("#{bin}/corsa --help")
  end
end
