class SpryAT01111 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.111.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.111.1/spry-macos.tar.gz"
      sha256 "09f8188a6e8e6592109e44ebb13ed165dedf68882b851889fbfd8a3d13aaf58c"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.111.1/spry-macos.tar.gz"
      sha256 "09f8188a6e8e6592109e44ebb13ed165dedf68882b851889fbfd8a3d13aaf58c"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.111.1/spry_0.111.1-ubuntu22.04u1_amd64.deb"
    sha256 "d00955fbba48f58d4f5461df33494f79ff722cc9d474af1f867646e981392288"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.111.1-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
