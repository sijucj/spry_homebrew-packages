class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.6.0"
  license "MIT"

  on_macos do
    url "https://github.com/programmablemd/packages/releases/download/v1.6.0/spry-macos.tar.gz"
    sha256 "7501525af9e5e989cb4c661d66101791db58f5d0c99bf8d52f3c10e8ad7673ec"
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.6.0/spry_1.6.0-ubuntu22.04u1_amd64.deb"
    sha256 "35aff88b552c875dc110310b7a45d0f64e06ae67d69b61499616ed64751a746b"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.6.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end

