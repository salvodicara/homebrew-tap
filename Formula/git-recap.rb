class GitRecap < Formula
  desc "Reconstruct a work journal from your git history"
  homepage "https://github.com/salvodicara/git-recap"
  url "https://github.com/salvodicara/git-recap/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "1dad0df7bb7106c235608ea262bd3698af6c550ced332e81f70101fd291f9b99"
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
