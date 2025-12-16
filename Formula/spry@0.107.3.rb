class SpryAT01073 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "0.107.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.107.3/spry-macos.tar.gz"
      sha256 "d298f39db9958bd4fd0250f46fa5b023d7cbbc03fe42fe0f24d4e7647632b38c"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.107.3/spry-macos.tar.gz"
      sha256 "d298f39db9958bd4fd0250f46fa5b023d7cbbc03fe42fe0f24d4e7647632b38c"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.107.3/spry_0.107.3-ubuntu22.04u1_amd64.deb"
    sha256 "0104b20b4aa7c412971ea1e7b7d796ee9419692bd4e0a369a686e94a96c25386"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_0.107.3-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
