class MangaDownloader < Formula
  desc "Download manga chapters from supported sites into CBZ files"
  homepage "https://elboletaire.github.io/manga-downloader/"
  version "1.13.0"
  license "AGPL-3.0-only"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-arm64.tar.gz"
      sha256 "693cc5d5091354b1bf56f1436ae6abe7eb5a38ed71fa1eaa3ebe855e69620380"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-darwin-amd64.tar.gz"
      sha256 "1cffec88564c07424419fa4472fff3b51cb19de1434c48c241c4fe980e10efe7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-arm64.tar.gz"
      sha256 "fc9c94ed563369608b604a78a1accdeb585286d0bb3978d5e8644380a53944f0"
    end
    on_intel do
      url "https://github.com/elboletaire/manga-downloader/releases/download/v#{version}/manga-downloader-v#{version}-linux-amd64.tar.gz"
      sha256 "403bebcaeadd02f86ea44d94a344d435639b3bea8f3e03e55c3491e73e834964"
    end
  end

  def install
    bin.install "manga-downloader"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/manga-downloader --help")
  end
end
