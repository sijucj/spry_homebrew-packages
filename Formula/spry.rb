class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.100.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.100.7/spry-macos.tar.gz"
      sha256 "4a987c12600e095074b5b0fe12e93810f3bda66f4d9bebc9d2ca9a25858498ae"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.100.7/spry-macos.tar.gz"
      sha256 "4a987c12600e095074b5b0fe12e93810f3bda66f4d9bebc9d2ca9a25858498ae"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.100.7/spry_0.100.7-ubuntu22.04u1_amd64.deb"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.100.7-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end

