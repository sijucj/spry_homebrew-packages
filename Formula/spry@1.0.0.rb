class SpryAT100 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.0.0"
  license "MIT"

  url "https://github.com/programmablemd/packages/releases/download/v1.0.0/spry-macos.tar.gz"
  sha256 "bc311a136ada152d97de9a107f7b6b783f15a87261e8cc41101c2a76d1c66234"

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.0.0/spry_1.0.0-ubuntu22.04u1_amd64.deb"
    sha256 "b6feda95e000a415f0d3f71f324bba6a2db01a00cc31dfe83d205957ef6b7d98"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.0.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
