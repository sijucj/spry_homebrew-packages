class SpryAT152 < Formula
  desc "Spry CLI - A declarative web application framework"
  homepage "https://github.com/programmablemd/packages"
  version "1.5.2"
  license "MIT"

  url "https://github.com/programmablemd/packages/releases/download/v1.5.2/spry-macos.tar.gz"
  sha256 "ca654d8b6305fe1af95e0ac0f1fb5cb5aa56a1a65273629641b76860435cc959"

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v1.5.2/spry_1.5.2-ubuntu22.04u1_amd64.deb"
    sha256 "b735fd4053a61ca5768a94fc136c2af75d5e31b6aaa8f44ba37860be7ef5705a"
  end

  def install
    if OS.mac?
      bin.install "spry-macos" => "spry"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry_1.5.2-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry"
      man1.install Dir["usr/share/man/man1/*.1.gz"]
    end
  end

  test do
    system "#{bin}/spry", "--version"
  end
end
