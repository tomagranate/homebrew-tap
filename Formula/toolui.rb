# Homebrew formula for toolui
# Copy this to your homebrew-toolui repository at Formula/toolui.rb

class Toolui < Formula
  desc "Terminal UI for running multiple local dev servers simultaneously"
  homepage "https://github.com/tomagranate/toolui"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-darwin-arm64.tar.gz"
      sha256 "1ce432fcebbdf21782310edf16cd428ede86f79da5b3285d7c70ca6bf39526d0"

      def install
        bin.install "toolui-darwin-arm64" => "toolui"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-darwin-x64.tar.gz"
      sha256 "b8c187d61c979ab00b96ba2f5d57dad5fdae785fbf1830824cfefe03ed4ed298"

      def install
        bin.install "toolui-darwin-x64" => "toolui"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-linux-arm64.tar.gz"
      sha256 "69971a05d7b14ef306fb0254f0faa0a93192c5abf73e9b509fdc550478a89452"

      def install
        bin.install "toolui-linux-arm64" => "toolui"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-linux-x64.tar.gz"
      sha256 "daa22b0f0243e004b3c02803ebc5066d79cea0df23eb483a65613858897653f5"

      def install
        bin.install "toolui-linux-x64" => "toolui"
      end
    end
  end

  test do
    assert_match "toolui", shell_output("#{bin}/toolui --help")
  end
end
