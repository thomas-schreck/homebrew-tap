class QDns < Formula
  desc "A tiny and feature-rich command line DNS client with support for UDP, TCP, DoT, DoH, DoQ, and ODoH."
  homepage "https://github.com/natesales/q"
  url "https://github.com/natesales/q/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "3e611ad53c441744c60e0b522207b8f5c3fe0ebde35f2289533436b310de68f7"
  license "GPL-3.0-only"

  depends_on "go"

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/natesales/q").install buildpath.children
    cd "src/github.com/natesales/q" do
      system "go", "build", "-o", bin/"q", "."
    end
  end

  test do
    system "false"
  end
end
