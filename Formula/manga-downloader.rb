class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ or EPUB files"
  homepage "https://mangadownloader.cat/"
  version "1.19.0"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "4d62a24638c70b399579c2710c0521a590aa87571e52354052371cf8a1df6c5a"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "c4cd3e8fbf8c435932b127ca146110bf9fb7e99838616fc9142ea1fa54c0b5d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "d2b0d5c6aa17c5cd169a54646d92ffb37e54c6c04152d5705925c1171a0739d1"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "6b3b55e46a6624efb30260fc022831595fea67bff5cd49f4634b907e06a8d6f4"
    end
  end

  def install
    bin.install "manga-downloader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/manga-downloader --help")
  end
end
