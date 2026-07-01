class GitRecap < Formula
  desc "Reconstruct a work journal from your git history"
  homepage "https://github.com/salvodicara/git-recap"
  url "https://github.com/salvodicara/git-recap/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e357f72c0b38be0e6b3374e1c1c29b465a10238ca8deaf60a0bcd3b028350876"
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
