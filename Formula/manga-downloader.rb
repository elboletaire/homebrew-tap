class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ or EPUB files"
  homepage "https://mangadownloader.cat/"
  version "1.16.0"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "d2095dd92b5fe9e042d1f21239dfadb95b08aad294b60f5c451a91b770bd2596"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "9b2c17debb14a3473f923e6b61e87bceb6ca16b02b4c3e65ffa614ec0ab8aa4a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "de192d3b4608d8882b1f3b7104464654eac321171fc8f514c428cd46988279f2"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "50ff12a2eebc1b8eb8e695389edb1d8c086c847b237986adbbb3962961a7fa87"
    end
  end

  def install
    bin.install "manga-downloader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/manga-downloader --help")
  end
end
