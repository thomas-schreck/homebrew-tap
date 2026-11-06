class Hexwerk < Formula
  desc "Command-line hex tool with Kaitai Struct, YARA-X and scripting"
  homepage "https://github.com/thomas-schreck/hexwerk"
  url "https://github.com/thomas-schreck/hexwerk/releases/download/v0.1.0-beta.1/hexwerk-cli-0.1.0-beta.1-arm64.tar.gz"
  version "0.1.0-beta.1"
  sha256 "b27eeaf4fdae1be6f55cc5a5237f47a98f6e24eb581a126b6b691b9dd9821965"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    # The binary looks for magic.mgc next to itself (after resolving the symlink).
    libexec.install "hexwerk", "magic.mgc"
    bin.install_symlink libexec/"hexwerk"
    prefix.install "LICENSE", "THIRD_PARTY_NOTICES.md"
  end

  test do
    (testpath/"t.bin").write "\x89PNG\r\n\x1a\n"
    assert_match "0x00000000", shell_output("#{bin}/hexwerk dump #{testpath}/t.bin")
    assert_match "PNG", shell_output("HEXWERK_LANG=en #{bin}/hexwerk type #{testpath}/t.bin")
  end
end
