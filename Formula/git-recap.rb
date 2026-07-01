class GitRecap < Formula
  desc "Reconstruct a work journal from your git history"
  homepage "https://github.com/salvodicara/git-recap"
  url "https://github.com/salvodicara/git-recap/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "1201a2ce2ae28969709a65de2912f6ddec2af2978b06549eb09bb29b20698b39"
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
