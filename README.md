# elboletaire/homebrew-tap

Homebrew formulae and casks for elboletaire's projects.

| | Install |
|---|---|
| [Fastlight](https://elboletaire.github.io/fastlight/), a Spotlight-style launcher for macOS | `brew install --cask elboletaire/tap/fastlight` |
| [Manga Downloader](https://elboletaire.github.io/manga-downloader/) desktop app (macOS) | `brew install --cask elboletaire/tap/manga-downloader` |
| [Manga Downloader](https://elboletaire.github.io/manga-downloader/) command line tool (macOS, Linux) | `brew install elboletaire/tap/manga-downloader` |

Installing by its full name trusts only that formula or cask, as Homebrew 6 and later require for third-party taps. `brew upgrade` updates them.

Neither app is notarized yet, so the first time one opens, macOS blocks it: go to System Settings › Privacy & Security and click **Open Anyway**. The command line tool isn't affected.

## Fastlight

- `brew upgrade --cask fastlight` updates it (it quits and reopens Fastlight).
- `brew uninstall --cask fastlight` removes it and stops its search daemon.
- `brew uninstall --zap --cask fastlight` also deletes its settings, logs and extension data (extensions you installed stay), and fsearch's index in `~/Library/Application Support/FSearch` unless a standalone fsearch is installed.

See the [Fastlight README](https://github.com/elboletaire/fastlight#install) for Full Disk Access.

## Manga Downloader

With both installed, `manga-downloader ui` opens the desktop app. `brew uninstall --zap --cask manga-downloader` also deletes the app's settings, but keeps the folder it shares with the command line tool.

## Where the files come from

Each project's release workflow updates its files here. Their sources live in the project's repository, so change them there, not here:

- Fastlight: [`packaging/homebrew/tap`](https://github.com/elboletaire/fastlight/tree/main/packaging/homebrew/tap)
- Manga Downloader: [`packaging/homebrew/tap`](https://github.com/elboletaire/manga-downloader/tree/master/packaging/homebrew/tap)

This README is the exception: it's edited here by hand.
