class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ or EPUB files"
  homepage "https://mangadownloader.cat/"
  version "1.18.0"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "4f822aebecfe959c85f0639f73fe86f613af1f5a72e5c1c393ff38b1f265da8e"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "36551b5a8e54b8663fbcb5ea32bd1448b583bd8920de03bec4b36834988e226b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "a8bed0ec21f0bef583d28128d276ebaa3678ec90e7a2ce5636de5e16f4b0d20d"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "21226cab11ade9e99cc28ff6513d8388ee406f289bcbd365130b36767de70e95"
    end
  end

  def install
    bin.install "manga-downloader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/manga-downloader --help")
  end
end
