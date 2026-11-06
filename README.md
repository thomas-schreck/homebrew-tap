# Homebrew tap for hexwerk

[hexwerk](https://github.com/thomas-schreck/hexwerk) — a native macOS hex editor with Kaitai Struct, YARA-X and scripting.

```sh
brew tap thomas-schreck/tap
brew trust thomas-schreck/tap                    # Homebrew asks before using third-party taps
brew install --cask thomas-schreck/tap/hexwerk   # the app
brew install thomas-schreck/tap/hexwerk          # the hexwerk command line tool
```

Apple silicon only. The app is not notarized: on first start allow it under
*System Settings → Privacy & Security → Open Anyway*.

The cask and the formula are updated automatically by hexwerk's release
workflow (`update.sh`). Issues and questions belong in the
[hexwerk repository](https://github.com/thomas-schreck/hexwerk/issues).
