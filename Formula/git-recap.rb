class GitRecap < Formula
  desc "Reconstruct a work journal from your git history"
  homepage "https://github.com/salvodicara/git-recap"
  url "https://github.com/salvodicara/git-recap/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a234c7560935fedee8b71a21fe9e25d7d0cffbc3511b028b3ae8bb8664bee771"
  license "MIT"
  head "https://github.com/salvodicara/git-recap.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "journal_root", shell_output("#{bin}/git-recap config")
  end
end
