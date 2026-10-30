class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ, CBR or EPUB files"
  homepage "https://mangadownloader.cat/"
  version "24.1.0"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "7369e33bbaa43525b1df237669ed2cabfa973045733e3dcc1a7df81661021818"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "d1cff1897910a48afd081116678bb8b44995acc3618508fa2d06976360c3d585"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "c3b87c517ff1899a2137ce5bcd0c01e9dfea820e4533f5d34b6430c771adc886"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "9d61a00e21a028b58f3edc5a45504ba85f8c664eaae6a67f1f9450ac8de7a84a"
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
