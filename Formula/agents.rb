class Agents < Formula
  desc "Manage shared AI agent configuration and chat archives"
  homepage "https://github.com/tomagranate/agents"
  version "0.8.1"
  license "MIT"
  head "https://github.com/tomagranate/agents.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-aarch64-apple-darwin.tar.gz"
      sha256 "3428877a985f0272daf06ffb7039b81a1fd183679947e980bda7b3e942f2edfd"
    else
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-x86_64-apple-darwin.tar.gz"
      sha256 "b5873d42389bf520d11c6ac783effb9e77b62627f4021f9353101547bf2b92b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26faa4b40316a2e1c65f4196817ba522342482618b1efdec5e30e7585ccedc50"
    else
      url "https://github.com/tomagranate/agents/releases/download/v#{version}/agents-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9e30ed24a4a4d8cc50a7b47c732738c5398c96ef71c19cdd017581663800f62"
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
