cask "hexwerk" do
  version "0.2.1"
  sha256 "845c3366078653f7876737b506a5e91b404f6f5192397dd368a2e79b5ffda7b1"

  url "https://github.com/thomas-schreck/hexwerk/releases/download/v#{version}/hexwerk-#{version}.zip"
  name "hexwerk"
  desc "Hex editor with Kaitai Struct, YARA-X and scripting"
  homepage "https://github.com/thomas-schreck/hexwerk"

  depends_on arch: :arm64
  depends_on :macos

  app "hexwerk.app"

  # ~/.config/hexwerk holds the user's own formats, rules and settings; it is
  # intentionally not removed.
  zap trash: [
    "~/Library/Caches/hexwerk",
    "~/Library/Preferences/de.schreck-thomas.hexwerk.plist",
    "~/Library/Saved Application State/de.schreck-thomas.hexwerk.savedState",
  ]

  caveats <<~EOS
    hexwerk is ad-hoc signed and not notarized. On first start macOS blocks it:
    open it once, then allow it under
      System Settings → Privacy & Security → Open Anyway
  EOS
end
