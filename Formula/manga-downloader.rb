class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ, CBR or EPUB files"
  homepage "https://mangadownloader.cat/"
  version "1.21.0"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "bf2212a8f7a161bd6262734ae32ce634420147ccbe907415507da6d0b0693f41"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "a77ab88d42b931be66df6f9a5b2ccac839a214748af0ed7b23814b376524efa5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "1bb1eb4a665c7135987fd166b15bb455ae9ae46eea133fb611a6e9e784540f97"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "6f4093191641d4c0ff373ff95f55ae0941267cc2afc6e0f1d468102f6c7a8c2a"
    end
  end

  def install
    bin.install "manga-downloader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/manga-downloader --help")
  end
end
