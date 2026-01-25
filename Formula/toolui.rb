# Homebrew formula for toolui
# Copy this to your homebrew-toolui repository at Formula/toolui.rb

class Toolui < Formula
  desc "Terminal UI for running multiple local dev servers simultaneously"
  homepage "https://github.com/tomagranate/toolui"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-darwin-arm64.tar.gz"
      sha256 "e5b4ce383cde6a2023ccb8b5a482ebb26690cdf5c15827e86a585cc73be4332a"

      def install
        bin.install "toolui-darwin-arm64" => "toolui"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-darwin-x64.tar.gz"
      sha256 "6659ab9930c7057d44f5b94533174849e9086934f3918ff599ecc381938226d9"

      def install
        bin.install "toolui-darwin-x64" => "toolui"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-linux-arm64.tar.gz"
      sha256 "b866780d7a37b552a759750d90e86eb8f89b7210aa590f4ccda5ea6356d962f2"

      def install
        bin.install "toolui-linux-arm64" => "toolui"
      end
    end

    on_intel do
      url "https://github.com/tomagranate/toolui/releases/download/v#{version}/toolui-linux-x64.tar.gz"
      sha256 "c200437121594ccb7fb113be14d39b2f5ced5056e05070e3ca9a5b6be247776c"

      def install
        bin.install "toolui-linux-x64" => "toolui"
      end
    end
  end

  test do
    assert_match "toolui", shell_output("#{bin}/toolui --help")
  end
end
