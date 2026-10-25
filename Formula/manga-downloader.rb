class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ, CBR or EPUB files"
  homepage "https://mangadownloader.cat/"
  version "23.0.0"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "af09b845c6f3689355b4db6753a377e0a67fddb138a0b97680faf0a967f563af"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "bc118de66fccbe5fae79274bde9400c5b74a3994d259c72bf3489709cf256d86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "af8df146ec17f600d7e22303e41041c1113c42d8d95fab1033d0564b9dbb3035"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "fddf6f28d309f3ae68b83edbfdf6b0606b1c1733501270456945c2a9aa1e966a"
    end
  end

  def install
    bin.install "manga-downloader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/manga-downloader --help")
  end
end
