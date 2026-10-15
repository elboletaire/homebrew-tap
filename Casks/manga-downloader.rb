cask "manga-downloader" do
  version "1.17.0"
  sha256 "c6e8e9a00db79c3502b8ef407238b1604095ce1b58ccfdef449022d32d2e470e"

  url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-gui-v#{version}-darwin-universal.zip"
  name "Manga Downloader"
  desc "Download manga chapters to CBZ or EPUB files"
  homepage "https://mangadownloader.cat/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The old name of manga-downloader-app, kept so that installs of it hear about
  # the rename. Delete it after a few releases.
  deprecate! date:             "2026-10-14",
             because:          "is now called manga-downloader-app",
             replacement_cask: "manga-downloader-app"

  conflicts_with cask: "elboletaire/tap/manga-downloader-app"
  depends_on :macos

  app "Manga Downloader.app"
  # `manga-downloader ui` looks for manga-downloader-gui next to the CLI or on
  # PATH, so link the app's executable there.
  binary "#{appdir}/Manga Downloader.app/Contents/MacOS/manga-downloader-gui", target: "manga-downloader-gui"

  # ~/Library/Application Support/manga-downloader is shared with the CLI (the
  # Manga Plus secret lives there), so only the app's own settings file goes.
  zap trash: [
    "~/Library/Application Support/manga-downloader/gui.json",
    "~/Library/Caches/com.github.elboletaire.mangadownloader",
    "~/Library/HTTPStorages/com.github.elboletaire.mangadownloader",
    "~/Library/Preferences/com.github.elboletaire.mangadownloader.plist",
    "~/Library/Saved Application State/com.github.elboletaire.mangadownloader.savedState",
    "~/Library/WebKit/com.github.elboletaire.mangadownloader",
  ]

  caveats <<~EOS
    This cask is now called manga-downloader-app. To switch, run:
      brew uninstall --cask manga-downloader && brew install --cask elboletaire/tap/manga-downloader-app

    Manga Downloader is not notarized yet, so macOS blocks it the first time it opens.
    Go to System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
