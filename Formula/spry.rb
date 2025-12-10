class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.101.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.101.3/spry-macos.tar.gz"
      sha256 "03ce22953ed937de755d728bf9b491e5dc2c4ce2eeacd59c8511edfc552c6363"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.101.3/spry-macos.tar.gz"
      sha256 "03ce22953ed937de755d728bf9b491e5dc2c4ce2eeacd59c8511edfc552c6363"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.101.3/spry_0.101.3-ubuntu22.04u1_amd64.deb"
    sha256 "987142c74be78d1c62dd842826900c4695707d0c08cec9c80160a299fc65c6c9"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.101.3-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end

