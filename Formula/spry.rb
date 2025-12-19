class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.109.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.109.2/spry-macos.tar.gz"
      sha256 "963ac1e88047484abfafcc8aadc8a283c648c3fc1cb7cea010031ba17010d86b"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.109.2/spry-macos.tar.gz"
      sha256 "963ac1e88047484abfafcc8aadc8a283c648c3fc1cb7cea010031ba17010d86b"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.109.2/spry_0.109.2-ubuntu22.04u1_amd64.deb"
    sha256 "014d074bcf0a33ff8b4ba10d9ab02d3b4d4c734895a4cebb6a058b1f52cbf674"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.109.2-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end

