class SpryAT01110 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.111.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.111.0/spry-macos.tar.gz"
      sha256 "091c2dc8dd647a8f7a8be5418888860cb298ec4badcdf3567779d7b2bea58568"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.111.0/spry-macos.tar.gz"
      sha256 "091c2dc8dd647a8f7a8be5418888860cb298ec4badcdf3567779d7b2bea58568"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.111.0/spry_0.111.0-ubuntu22.04u1_amd64.deb"
    sha256 "c06d225c6c58f66ecdf2d87c78ecd52ac69bd50c58a49ce49661e4c796de8d66"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.111.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
