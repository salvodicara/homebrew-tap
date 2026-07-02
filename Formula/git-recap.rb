class GitRecap < Formula
  desc "Reconstruct a work journal from your git history"
  homepage "https://github.com/salvodicara/git-recap"
  url "https://github.com/salvodicara/git-recap/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "e0b930c72fd3c10abb3eceb2f8c007d9393791b811b745b06891dc4edfc07b6a"
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
