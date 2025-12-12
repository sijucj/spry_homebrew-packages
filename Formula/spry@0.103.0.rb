class SpryAT01030 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.103.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.103.0/spry-macos.tar.gz"
      sha256 "b8026e589ae55a483ac9bb8be38a63d8776c7a496f8ca4d552ac0caf55af5034"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.103.0/spry-macos.tar.gz"
      sha256 "b8026e589ae55a483ac9bb8be38a63d8776c7a496f8ca4d552ac0caf55af5034"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.103.0/spry_0.103.0-ubuntu22.04u1_amd64.deb"
    sha256 "f191330caa96f18ac75c7ce7700c42a4e8546fc3d8dfc07793e98c34d45e58b2"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.103.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
