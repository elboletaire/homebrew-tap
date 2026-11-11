class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ, CBR or EPUB files"
  homepage "https://mangadownloader.cat/"
  version "25.2.0"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "396628143b39c62a8c4dfaaac3a3555b06d3cd560f7a4cb55151bad4feee97a3"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "3b5a8c57ec1ae44603190c769cbc19136a2ab18ac6cd9c41a858311ef2a874f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "5f383af152923a174df2877b8b08ec1690bdd075f8802edcd70063c66bd1e8ab"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "53485ced936dd0c62bf92a9cc5ad6b458eb54760d611d4fcc4912f2bb772b0b7"
    end
  end

  def install
    bin.install "manga-downloader"
    generate_completions_from_executable(bin/"manga-downloader", "completion")
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/manga-downloader --help")
    assert_match "manga-downloader", shell_output("#{bin}/manga-downloader completion bash")
  end
end
