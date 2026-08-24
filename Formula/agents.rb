class Agents < Formula
  desc "Manage shared AI agent configuration and chat archives"
  homepage "https://github.com/tomagranate/agents"
  version "0.8.4"
  license "MIT"
  head "https://github.com/tomagranate/agents.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-aarch64-apple-darwin.tar.gz"
      sha256 "98ae2a7a05021ad52424828e31bab64a0f8002d2814fec0380aa6f7c62afeb2b"
    else
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-x86_64-apple-darwin.tar.gz"
      sha256 "5d440c18e038436496a1a9de382e798e8db64b74e0324efa9799e8f0feebe23f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9191eca2d7e7baa0ff160a7ed048da1de6cd7061ca310024cc7ce5672fdd753b"
    else
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d988cbedbe4a1fb4d14044cdb16ba1434338468bc75f721208d7cf89f920949"
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
