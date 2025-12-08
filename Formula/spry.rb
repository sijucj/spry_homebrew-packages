class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.90.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.90.0/spry-macos.tar.gz"
      sha256 "452e879cb8b2040b09d9bf40a47b49ceeb9d9dcf14ddbe15d9298c960eb452fc"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.90.0/spry-macos.tar.gz"
      sha256 "452e879cb8b2040b09d9bf40a47b49ceeb9d9dcf14ddbe15d9298c960eb452fc"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.90.0/spry-sqlpage_0.90.0-ubuntu22.04u1_amd64.deb"
    sha256 "8fc97288dbc5259e30b48fe25438993698f8e834fd9904f7f191248d91e23de1"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry-sqlpage_0.90.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end

