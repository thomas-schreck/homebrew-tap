cask "hexwerk" do
  version "0.1.0"
  sha256 "477c89963ef5b3993ef8e0ebe2da208bb529bd13c32e5be95063382fb7080a47"

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
