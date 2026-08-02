class Agents < Formula
  desc "Sync and inspect global AGENTS.md + skills across AI coding harnesses"
  homepage "https://github.com/tomagranate/agents"
  url "https://github.com/tomagranate/agents/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d82447f9f39dbaed2b437d420492332997edbe4228409ff8dccd854151152f7e"
  license "MIT"
  head "https://github.com/tomagranate/agents.git", branch: "main"

  def install
    bin.install "bin/agents"
    (pkgshare/"templates").install Dir["share/templates/*"]
  end

  def caveats
    <<~EOS
      Scaffold config and wire Claude / Codex / Grok / OpenCode:

        agents init
        agents sync

      Shared rules live in ~/.agents/AGENTS.md
      Harness-only rules live in ~/.agents/harness/<name>.md
    EOS
  end

  test do
    assert_match "agents", shell_output("#{bin}/agents version")
    assert_match "Usage", shell_output("#{bin}/agents help")
  end
end
