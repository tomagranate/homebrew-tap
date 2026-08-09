class Agents < Formula
  desc "Manage shared AI agent configuration and chat archives"
  homepage "https://github.com/tomagranate/agents"
  version "0.6.0"
  license "MIT"
  head "https://github.com/tomagranate/agents.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v0.6.0/agents-aarch64-apple-darwin.tar.gz"
      sha256 "a6271aa5097077d6cb1bc227e6600080b025fad240311f01f765110a580eb7fe"
    else
      url "https://github.com/tomagranate/agents/releases/download/v0.6.0/agents-x86_64-apple-darwin.tar.gz"
      sha256 "e4578b041fcfd4df1f74c19fd55746f1e574accf68e8316d84d3e4a98443324f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v0.6.0/agents-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca55a752383431a94d64dc2c902bd40658fbf181e31b0f8368845d6506d6b8ef"
    else
      url "https://github.com/tomagranate/agents/releases/download/v0.6.0/agents-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f79af9023144db06abc4bbb10b738dcc4490cf9e5c35d1149a44a27848a91489"
    end
  end

  def install
    bin.install "agents"
  end

  def caveats
    <<~EOS
      Initialize or clone your private agents-home repository, then run:

        agents sync

      Use `agents status` to inspect local and remote state.
    EOS
  end

  test do
    assert_match "agents 0.6.0", shell_output("#{bin}/agents version")
    assert_match "Usage: agents", shell_output("#{bin}/agents --help")
  end
end
