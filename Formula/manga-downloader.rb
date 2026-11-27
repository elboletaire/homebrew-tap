class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ, CBR or EPUB files"
  homepage "https://mangadownloader.cat/"
  version "25.4.1"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "170988d519b7ba42ae113c8ba87a1f340e374d5d0c94a738a49665a48d142950"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "057e668092b752ef0046b4499139cce3f223095763fca20e4429828785c1efcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "a1f51df69d661bdc2312d532ce21787475e8ea0dc6537d2ef08f177aa476f8cf"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "253c49b63541383b21941189a4940b62e6de67e95a3bd487a8c31834e6fe3102"
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
