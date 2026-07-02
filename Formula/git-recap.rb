class GitRecap < Formula
  desc "Reconstruct a work journal from your git history"
  homepage "https://github.com/salvodicara/git-recap"
  url "https://github.com/salvodicara/git-recap/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "c9f79d1deb4366744e67b156c0aa01674c9ebae1be561667622b24a83a843af6"
  license "MIT"
  head "https://github.com/salvodicara/git-recap.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=v#{version}")
    generate_completions_from_executable(bin/"git-recap", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-recap version")
  end
end
