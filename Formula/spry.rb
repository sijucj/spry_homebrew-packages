class Spry < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.102.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.102.0/spry-macos.tar.gz"
      sha256 "f29b251b11fd385ee649ae90706232da08c1e1970e5d9265301c23f2e1eadb9e"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.102.0/spry-macos.tar.gz"
      sha256 "f29b251b11fd385ee649ae90706232da08c1e1970e5d9265301c23f2e1eadb9e"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.102.0/spry_0.102.0-ubuntu22.04u1_amd64.deb"
    sha256 "a9793e5cec9e1379ce1cf12f0152daabdece1f66ba26f966ac52789e72cdc68d"
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

