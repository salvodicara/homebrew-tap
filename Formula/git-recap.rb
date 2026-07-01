class GitRecap < Formula
  desc "Reconstruct a work journal from your git history"
  homepage "https://github.com/salvodicara/git-recap"
  url "https://github.com/salvodicara/git-recap/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "6d53ac0a847ac51311a230c5ae3c037ac222d07737a7d64204c6bc5e40dac3fd"
  license "MIT"
  head "https://github.com/salvodicara/git-recap.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-recap version")
  end
end
