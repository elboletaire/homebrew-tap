class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ files"
  homepage "https://mangadownloader.cat/"
  version "1.15.0"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "d936f320c920bb35a48a6e00395fddf5f45c8d2e80fc7dbeadf5843883603fc1"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "eea3fca76ef2179fd6bde10f20107883818c46e9188e96e0908964d27ef047a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "cd50cd0c5dd694ccaaa093683ddd12c3213a0178ec58d60854c632c0525aec34"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "87038e74c0ad41507d68ad8ff6b6a9a25133f7d92d390dcaa6ea59b6728a2d09"
    end
  end

  def install
    bin.install "manga-downloader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/manga-downloader --help")
  end
end
