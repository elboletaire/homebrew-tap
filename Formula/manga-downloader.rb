class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ, CBR or EPUB files"
  homepage "https://mangadownloader.cat/"
  version "25.3.0"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "0dce82b8ac789aee03c42b0e8050f70df2c25c3265c1ba00fc0433fd2d923bda"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "aa36ced2d69675312e0eefb8158a0d21dd79db293fafb26ae7119e8dc0208be2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "bd7065acb5f7528de0c7fcdcfd2895b8bad58b4fe688f58b5ec2aeac04750def"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "2ff911436f853457aef21ed3c1a86425d0f380dc26235d47777e362a260fdf34"
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
