class SpryAT103 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.0.3"
  license "MIT"

  url "https://github.com/programmablemd/packages/releases/download/v1.0.3/spry-macos.tar.gz"
  sha256 "d92443703c3affbf26dd64e7d66bab017e7da254c7f6019a5984d0703146a6b5"

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.0.3/spry_1.0.3-ubuntu22.04u1_amd64.deb"
    sha256 "0fd0b04710b693434f7e143b0fe0a22d1481711ef168cf03733e910dcb09f998"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.0.3-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
