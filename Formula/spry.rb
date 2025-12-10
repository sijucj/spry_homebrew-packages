class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.102.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.102.0/spry-macos.tar.gz"
      sha256 "6a7ee67d523206152b8b810fef0144f175b6b778557bfa53915bb3beec6d6b46"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.102.0/spry-macos.tar.gz"
      sha256 "6a7ee67d523206152b8b810fef0144f175b6b778557bfa53915bb3beec6d6b46"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.102.0/spry_0.102.0-ubuntu22.04u1_amd64.deb"
    sha256 "bfb15973ae2703bd53b9a679b72d76d54fba6b498650ee4f0ffb94b9357ed885"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.102.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end

