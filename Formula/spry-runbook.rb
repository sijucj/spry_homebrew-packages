class SpryRunbook < Formula
  desc "Spry Runbook CLI - A runbook execution tool"
  homepage "https://github.com/programmablemd/packages"
  version "0.80.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/programmablemd/packages/releases/download/v0.80.0/spry-runbook-macos.tar.gz"
      sha256 "09c21b73030e8e343654a3cb4e3733d54b6e0ac01ad17ac18c9eaaf43be262d3"
    else
      url "https://github.com/programmablemd/packages/releases/download/v0.80.0/spry-runbook-macos.tar.gz"
      sha256 "09c21b73030e8e343654a3cb4e3733d54b6e0ac01ad17ac18c9eaaf43be262d3"
    end
  end

  on_linux do
    url "https://github.com/programmablemd/packages/releases/download/v0.80.0/spry-sqlpage_0.80.0-ubuntu22.04u1_amd64.deb"
    sha256 "427e449fb6c24c1b0eb48ddd83c3c65c1f8002674dca80886d4df099360808ba"
  end

  def install
    if OS.mac?
      bin.install "spry-runbook-macos" => "spry-runbook"
    elsif OS.linux?
      # For Linux, extract the DEB package using dpkg-deb
      system "dpkg-deb", "-x", "spry-sqlpage_0.80.0-ubuntu22.04u1_amd64.deb", "."
      bin.install "usr/bin/spry-runbook"
    end
  end

  test do
    system "#{bin}/spry-runbook", "--version"
  end
end

