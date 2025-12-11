class SpryAT01021 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.102.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.102.1/spry-macos.tar.gz"
      sha256 "5f454724f9f8e409fbeabd1a0592f090d16bb36762a9c7de5e53bf3465a4961e"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.102.1/spry-macos.tar.gz"
      sha256 "5f454724f9f8e409fbeabd1a0592f090d16bb36762a9c7de5e53bf3465a4961e"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.102.1/spry_0.102.1-ubuntu22.04u1_amd64.deb"
    sha256 "51f1ab34812b2701c40fae49bba490df69d6b661fb075742f74fd4b9b162f999"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.102.1-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
