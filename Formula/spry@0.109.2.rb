class SpryAT01092 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.109.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.109.2/spry-macos.tar.gz"
      sha256 "dc27b2977214e21304dde5434cab6c42a3eeeb4ebb74fa04a3440d32caaaa96a"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.109.2/spry-macos.tar.gz"
      sha256 "dc27b2977214e21304dde5434cab6c42a3eeeb4ebb74fa04a3440d32caaaa96a"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.109.2/spry_0.109.2-ubuntu22.04u1_amd64.deb"
    sha256 "73fe7fdadc50e1861817ad25732c813b95e3bbbf62de3dcb8f6798410ab30f06"
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
