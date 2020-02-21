class Openlibm < Formula
  desc "High quality system independent, portable, open source libm implementation"
  homepage "https://openlibm.org"
  url "https://github.com/JuliaMath/openlibm/archive/v0.7.0.tar.gz"
  sha256 "1699f773198018b55b12631db9c1801fe3ed191e618a1ee1be743f4570ae06a3"

  def install
    lib.mkpath
    (lib/"pkgconfig").mkpath
    (include/"openlibm").mkpath

    system "make", "install", "prefix=."

    lib.install Dir["lib/*"].reject { |f| File.directory? f }
    (lib/"pkgconfig").install Dir["lib/pkgconfig/*"]
    (include/"openlibm").install Dir["include/openlibm/*"]
  end

  test do
    system "make", "test"
  end
end
