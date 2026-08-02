class Agents < Formula
  desc "Sync and inspect global AGENTS.md + skills across AI coding harnesses"
  homepage "https://github.com/tomagranate/agents"
  url "https://github.com/tomagranate/agents/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "72799651f0affc39e751f00625eccc844b7b6fac9c2942f8387afe489d71fed0"
  license "MIT"
  head "https://github.com/tomagranate/agents.git", branch: "main"

  def install
    bin.install "bin/agents"
    (pkgshare/"templates").install Dir["share/templates/*"]
  end

  def caveats
    <<~EOS
      Multi-machine content (private repo):

        git clone git@github.com:tomagranate/agents-home.git ~/.agents
        agents sync

      Or scaffold empty templates:

        agents init

      Day to day: agents pull / agents push -m "msg"
    EOS
  end

  test do
    assert_match "agents", shell_output("#{bin}/agents version")
    assert_match "Usage", shell_output("#{bin}/agents help")
  end
end
