class Agents < Formula
  desc "Manage shared AI agent configuration and chat archives"
  homepage "https://github.com/tomagranate/agents"
  version "0.11.0"
  license "MIT"
  head "https://github.com/tomagranate/agents.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-aarch64-apple-darwin.tar.gz"
      sha256 "51f20caf1aa747b3060382475eb081ffb8e751ba738bda1b04baa6e65d3682b7"
    else
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-x86_64-apple-darwin.tar.gz"
      sha256 "ca6d4637cabe838a8faa0f800e8b3368e6e51c7ae90ade526b5736825780543f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eb0b636d4697f64edf8514f87b753c2f2e0c9958aed84e9ba75a09f2eaf58ce1"
    else
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99cdcb8c40b953981e1f6ac295b3420073d18a913e770cbf1af07ae5251bb969"
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
