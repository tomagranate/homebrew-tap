# Homebrew formula for toolui
# Copy this to your homebrew-toolui repository at Formula/toolui.rb

class Toolui < Formula
  desc "Terminal UI for running multiple local dev servers simultaneously"
  homepage "https://github.com/tomagranate/toolui"
  version "0.3.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-darwin-arm64.tar.gz"
      sha256 "cc9a7f8679494b59fbc90fa337426aeac593b7910da3f2201134ce2e282a05e0"

      def install
        bin.install "toolui-darwin-arm64" => "toolui"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-darwin-x64.tar.gz"
      sha256 "c3204afcd05eca988ba7a2a10a2e97194004ba716229797c0af272ee695c8049"

      def install
        bin.install "toolui-darwin-x64" => "toolui"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-linux-arm64.tar.gz"
      sha256 "e9dd406afe99c1a4baa40a0faa1f1cd4798df8d9f21e90ac5c38f1de49177ff6"

      def install
        bin.install "toolui-linux-arm64" => "toolui"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-linux-x64.tar.gz"
      sha256 "fae4410ea53a51991fe33222cbf771db9ae4823f3ea56eed16e0cf98ebe24f44"

      def install
        bin.install "toolui-linux-x64" => "toolui"
      end
    end
  end

  test do
    assert_match "toolui", shell_output("#{bin}/toolui --help")
  end
end
