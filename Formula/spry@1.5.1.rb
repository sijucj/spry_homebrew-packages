class SpryAT151 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.5.1"
  license "MIT"

  url "https://github.com/programmablemd/packages/releases/download/v1.5.1/spry-macos.tar.gz"
  sha256 "eb4d0c96cd35e3b532e946778a60935aba42affc5e86ae91accb0958cc3ea9cd"

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.5.1/spry_1.5.1-ubuntu22.04u1_amd64.deb"
    sha256 "0c12f6f8e71c0b8fa700c960859db6972ecf0699b8abd8f8b1639f2331a8e9fa"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.5.1-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
