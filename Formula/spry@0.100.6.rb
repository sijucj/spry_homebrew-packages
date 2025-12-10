class SpryAT01006 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.100.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.100.6/spry-macos.tar.gz"
      sha256 "6bf48b4b87914f29849f7f5935b8422d9fa90512f4bcc46f9245fc228076d60b"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.100.6/spry-macos.tar.gz"
      sha256 "6bf48b4b87914f29849f7f5935b8422d9fa90512f4bcc46f9245fc228076d60b"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.100.6/spry_0.100.6-ubuntu22.04u1_amd64.deb"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.100.6-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
