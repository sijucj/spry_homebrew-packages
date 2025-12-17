class SpryAT01082 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.108.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.108.2/spry-macos.tar.gz"
      sha256 "bc006999a37c4e9959c09a85e4004773f92bb5e0e9d3b5e5ecb0fcf56dbb93c7"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.108.2/spry-macos.tar.gz"
      sha256 "bc006999a37c4e9959c09a85e4004773f92bb5e0e9d3b5e5ecb0fcf56dbb93c7"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.108.2/spry_0.108.2-ubuntu22.04u1_amd64.deb"
    sha256 "f591738d180810b53ed887d1605291dcd9bcd30477d270d45fcc380af87f65e0"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.108.2-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
