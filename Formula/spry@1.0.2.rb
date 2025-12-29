class SpryAT102 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.0.2"
  license "MIT"

  url "https://github.com/programmablemd/packages/releases/download/v1.0.2/spry-macos.tar.gz"
  sha256 "8d97e16ec7a194c8941e85cdcd4af5004791093664b1c8143706b57ac2ea1b2b"

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.0.2/spry_1.0.2-ubuntu22.04u1_amd64.deb"
    sha256 "fc04dc13472302c26e2a54077de9b2b9af39afbcddabb795bac5b3d128077a3b"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.0.2-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
