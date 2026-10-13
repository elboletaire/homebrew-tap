class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ files"
  homepage "https://mangadownloader.cat/"
  version "1.15.1"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "cfdba9de140772192bf0d0cf66a1ce97396b992fa42ea815529e861c4d90a905"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "e3a6750a87df08e9c4ad4b33987f2226f2592decf549f8c81b85f473084a463c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "e3e6251df66e3276545bfbeeb95d0c4d5268f312a5c9b24011c92c10147df7d3"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "a1b389894db66ca315ad3441524a94e9fd488a33a499cf8372b03f917304bda1"
    end
  end

  def install
    bin.install "manga-downloader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/manga-downloader --help")
  end
end
