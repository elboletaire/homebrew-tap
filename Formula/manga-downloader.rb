class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ or EPUB files"
  homepage "https://mangadownloader.cat/"
  version "1.17.0"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "0a096d24b9f48253e1cce52db1ccf0130f76c5b3b9eaa7a90675b73b7bdbe5a7"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "1a19441443ee3450661ade1c3800614beca10915a6ea2a81b5315e2f64328fcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "0bf151a31f0cfacd33446ef1bee14c58f7c1d402f35bffb91419393c311418a4"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "8fd9ee88e13212893df4e7d04cc5d57647bd4dda4a450a1154a115272dec3789"
    end
  end

  def install
    bin.install "manga-downloader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/manga-downloader --help")
  end
end
