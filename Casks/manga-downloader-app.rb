cask "manga-downloader-app" do
  version "23.0.1"
  sha256 "5655d6756283d6d92efac57a4f9049e5790c686cb65df53efaf6f1c4600c4468"

  url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-gui-v#{version}-darwin-universal.zip"
  name "Manga Downloader"
  desc "Download manga chapters to CBZ, CBR or EPUB files"
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
