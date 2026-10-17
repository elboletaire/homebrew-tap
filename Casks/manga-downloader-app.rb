cask "manga-downloader-app" do
  version "1.19.1"
  sha256 "20c510891a37de15cacbfd35a1076c799b26c48944623aa24970f12c64676d32"

  url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-gui-v#{version}-darwin-universal.zip"
  name "Manga Downloader"
  desc "Download manga chapters to CBZ or EPUB files"
  homepage "https://mangadownloader.cat/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Both casks install the same app and binary, so they can't be installed together.
  conflicts_with cask: "elboletaire/tap/manga-downloader"
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
    Manga Downloader is not notarized yet, so macOS blocks it the first time it opens.
    Go to System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
