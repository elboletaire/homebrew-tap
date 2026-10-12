cask "manga-downloader" do
  version "1.15.0"
  sha256 "3d851c62d1dc2da7c0be3e4b2275f1c528e73d2386d212c5da217bc410adc9dc"

  url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-gui-v#{version}-darwin-universal.zip"
  name "Manga Downloader"
  desc "Download manga chapters to CBZ files"
  homepage "https://mangadownloader.cat/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app and the command line tool go together: `manga-downloader ui` is the
  # CLI's, and the formula shares this cask's name, so it's easy to miss.
  depends_on formula: "elboletaire/tap/manga-downloader"

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
