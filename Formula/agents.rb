class Agents < Formula
  desc "Manage shared AI agent configuration and chat archives"
  homepage "https://github.com/tomagranate/agents"
  version "0.12.0"
  license "MIT"
  head "https://github.com/tomagranate/agents.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-aarch64-apple-darwin.tar.gz"
      sha256 "853ac59a9b8a9d5818d07cdc7ff81863d5e81b05b3a012c55b3e52341929e19a"
    else
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-x86_64-apple-darwin.tar.gz"
      sha256 "f708bbb0c69fa9b84151b0a994e1f2716aa37b1336b875a2428615b868041a47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c49f1173979f29706cee1e768551f00f5fe5af7284270243c0fef299172166d"
    else
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e4bf380661d52650585f560258e5221634c52372a044ef26b75442afe3cdea37"
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
