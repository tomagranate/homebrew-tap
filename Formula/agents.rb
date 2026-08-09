class Agents < Formula
  desc "Manage shared AI agent configuration and chat archives"
  homepage "https://github.com/tomagranate/agents"
  version "0.5.0"
  license "MIT"
  head "https://github.com/tomagranate/agents.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v0.5.0/agents-aarch64-apple-darwin.tar.gz"
      sha256 "54c16fa0d921fdf3640850eaec0b818e29579840603eecc1ff4987716a21a111"
    else
      url "https://github.com/tomagranate/agents/releases/download/v0.5.0/agents-x86_64-apple-darwin.tar.gz"
      sha256 "0979c92051f353edddcf0c3c4227110664a5944e6f1ffa4ad75647ff25d93f56"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v0.5.0/agents-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f1f2d9387c9d04602cd18a36033766e4912929c55e5ade5b93442ef06814d0f5"
    else
      url "https://github.com/tomagranate/agents/releases/download/v0.5.0/agents-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb94ac4e31df81352753ce2dd0ff7df2c3658dcaaaccbb8394e016f57e5632d6"
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
    assert_match "agents 0.5.0", shell_output("#{bin}/agents version")
    assert_match "Usage: agents", shell_output("#{bin}/agents --help")
  end
end
