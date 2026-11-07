class Hexwerk < Formula
  desc "Command-line hex tool with Kaitai Struct, YARA-X and scripting"
  homepage "https://github.com/thomas-schreck/hexwerk"
  url "https://github.com/thomas-schreck/hexwerk/releases/download/v0.1.0/hexwerk-cli-0.1.0-arm64.tar.gz"
  sha256 "aaf11270b37f4ec229f6b0ee5ac48807d052856a978d9253057b702b88acd211"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    # The binary looks for magic.mgc next to itself (after resolving the symlink).
    libexec.install "hexwerk", "magic.mgc"
    bin.install_symlink libexec/"hexwerk"
    prefix.install "LICENSE", "THIRD_PARTY_NOTICES.md"
    # Completions and man page are in the archive since hexwerk#117; older
    # releases do not have them.
    if File.exist?("completions")
      zsh_completion.install "completions/_hexwerk"
      bash_completion.install "completions/hexwerk.bash" => "hexwerk"
      fish_completion.install "completions/hexwerk.fish"
      man1.install "man/hexwerk.1"
    end
  end

  test do
    (testpath/"t.bin").write "\x89PNG\r\n\x1a\n"
    assert_match "89 50 4e 47", shell_output("#{bin}/hexwerk dump #{testpath}/t.bin")
    assert_match "PNG", shell_output("HEXWERK_LANG=en #{bin}/hexwerk type #{testpath}/t.bin")
  end
end
