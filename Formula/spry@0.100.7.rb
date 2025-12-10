class SpryAT01007 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.100.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.100.7/spry-macos.tar.gz"
      sha256 "9c28b3b8367beabef402d1cee97d827a88877a06f7b433abc045a5438e48e363"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.100.7/spry-macos.tar.gz"
      sha256 "9c28b3b8367beabef402d1cee97d827a88877a06f7b433abc045a5438e48e363"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.100.7/spry_0.100.7-ubuntu22.04u1_amd64.deb"
    sha256 "70144e186e422186420b942a6c6e7c2b0cc168116ef761828a266e80fc2dd81d"
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
