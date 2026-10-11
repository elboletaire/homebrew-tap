class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ files"
  homepage "https://elboletaire.github.io/manga-downloader/"
  version "1.14.0"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "0a2516433e1f89b13e7f89d222813bb776853529ff7e144aeb989c258e3a659f"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "d7abc4d3abeaffa17b5fb759471fdaad916dc3150197d6e996fc148a92fede4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "ff7d7ebe437116ca3f122888ce454f83971a0374a50b08a9bd5696334c3515c8"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "002859352b9bc59c318445ab43389dd4c27b84ce2ae9a480d51efdc1639cdcdd"
    end
  end

  def install
    bin.install "manga-downloader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/manga-downloader --help")
  end
end
