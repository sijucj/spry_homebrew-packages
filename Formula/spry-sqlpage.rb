class SprySqlpage < Formula
  desc "Spry SQLPage CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.80.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.80.0/spry-sqlpage-macos.tar.gz"
      sha256 "c37e5835d8b3e1dc58638eb69b8052d4a7336b3a1820e0b124f8fcb3dfd5211e"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.80.0/spry-sqlpage-macos.tar.gz"
      sha256 "c37e5835d8b3e1dc58638eb69b8052d4a7336b3a1820e0b124f8fcb3dfd5211e"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.80.0/spry-sqlpage_0.80.0-ubuntu22.04u1_amd64.deb"
    sha256 "427e449fb6c24c1b0eb48ddd83c3c65c1f8002674dca80886d4df099360808ba"
  end

  def install
    if OS.mac?
      bin.install "spry-sqlpage-macos" => "spry-sqlpage"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry-sqlpage_0.80.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry-sqlpage"
    end
  end

  test do
    system "#{bin}/spry-sqlpage", "--version"
  end
end

