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
      sha256 "bcab510f08690b8180e0ad5d96718dbf57de07f625c997e55b8923e20b980ef6"

      def install
        bin.install "toolui-darwin-arm64" => "toolui"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-darwin-x64.tar.gz"
      sha256 "cf5cb70f5ac69db3c88ea1bc15484058578e6667054792b7d98b313abc17c923"

      def install
        bin.install "toolui-darwin-x64" => "toolui"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-linux-arm64.tar.gz"
      sha256 "4ff8f1ae508c97b0dff9e78923fea6220e6db007db50b2c53daddda2e249812d"

      def install
        bin.install "toolui-linux-arm64" => "toolui"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-linux-x64.tar.gz"
      sha256 "6d3ffb079450e360aa9ff72e552a805382eccc4f660aa2bc0f80e8831f9675df"

      def install
        bin.install "toolui-linux-x64" => "toolui"
      end
    end
  end

  test do
    assert_match "toolui", shell_output("#{bin}/toolui --help")
  end
end
