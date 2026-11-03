class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ, CBR or EPUB files"
  homepage "https://mangadownloader.cat/"
  version "25.1.0"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "167acb65b0c40b5b1200f2ff515e6518c2d066652babbdf742dc1ab88a8e7794"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "8e4e0480aa96b9f1140e0f7b14bb9f1d30185b8dc970b04088252764eee54968"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "053f8168d8eac0bc60d5d7c8559ce9571259ad4cdaabbfc03af0e425cd6bc12e"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "8e6af896f98e34634e4c869e4ba1719c9d6bfaa7158a2b2c8944c218fe9d6512"
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
