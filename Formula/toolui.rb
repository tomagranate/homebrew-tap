# Homebrew formula for toolui
# Copy this to your homebrew-toolui repository at Formula/toolui.rb

class Toolui < Formula
  desc "Terminal UI for running multiple local dev servers simultaneously"
  homepage "https://github.com/tomagranate/toolui"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-darwin-arm64.tar.gz"
      sha256 "fa5d63500ae91cafa9ec39956fd6bd7f5f2506419f056a63b370da3ae14938de"

      def install
        bin.install "toolui-darwin-arm64" => "toolui"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-darwin-x64.tar.gz"
      sha256 "9a3952eec4aef303da9c35be3eec8eab03bed3d218e6fdc18faaddf3f73f4879"

      def install
        bin.install "toolui-darwin-x64" => "toolui"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-linux-arm64.tar.gz"
      sha256 "94112b958d79ac649723a870e6985e9f175489719522aebfbe26c01637c66f50"

      def install
        bin.install "toolui-linux-arm64" => "toolui"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-linux-x64.tar.gz"
      sha256 "dcbcbf4a4e0061663c787af63f0090d3c45d53b6f3d09d3df31d93901e9a697d"

      def install
        bin.install "toolui-linux-x64" => "toolui"
      end
    end
  end

  test do
    assert_match "toolui", shell_output("#{bin}/toolui --help")
  end
end
