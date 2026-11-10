cask "hexwerk" do
  version "0.3.1"
  sha256 "083d9972e7089e5a476ec288cca2351df055e1757e413ecf1b29ee7f27ef02d9"

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
