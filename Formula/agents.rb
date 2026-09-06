class Agents < Formula
  desc "Manage shared AI agent configuration and chat archives"
  homepage "https://github.com/tomagranate/agents"
  version "0.9.0"
  license "MIT"
  head "https://github.com/tomagranate/agents.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-aarch64-apple-darwin.tar.gz"
      sha256 "b6cb316e2a5fe965ef9ca9781eef028448362bc10c532fe665e7c8a5a33ce5b8"
    else
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-x86_64-apple-darwin.tar.gz"
      sha256 "665697c3de9aee8b4449b329cc96b801b5f3b26984870c1d05d3e508ca73bd2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32feeb5462bcfd89c173a400e336e7187d61d8f3b51aa1fd9a195cc31becd3e5"
    else
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3e8a795ce4acc6b5330b4e1731e2029a0c57537bdb23d6583bf1b32f6fc1cc2f"
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
    assert_match "agents #{version}", shell_output("#{bin}/agents version")
    assert_match "Usage: agents", shell_output("#{bin}/agents --help")
  end
end
