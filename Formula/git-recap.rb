class GitRecap < Formula
  desc "Reconstruct a work journal from your git history"
  homepage "https://github.com/salvodicara/git-recap"
  url "https://github.com/salvodicara/git-recap/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "4779acd70356c32c3014ecb0d78d08edd0ba23bc8f0cb79cde900b1631fb8331"
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
