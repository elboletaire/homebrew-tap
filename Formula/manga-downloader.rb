class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ or EPUB files"
  homepage "https://mangadownloader.cat/"
  version "1.19.1"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "32b763611dfcc9ec411ce551e0ddfd182f1894786cdf82a2054e2d1a8d9487dd"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "313a3ff6f4f39be049c0c32a1cfa219a49b5c8d17af614c513248a513fe0e20e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "3361161411523ed2975334a93078ad830f5620cbaa5751f5e34867ecb3b6ac32"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "cd211343c16428ccf450ed737cb452e8913f9021aac4c66552be1a8d8978c7ca"
    end
  end

  def install
    bin.install "manga-downloader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/manga-downloader --help")
  end
end
