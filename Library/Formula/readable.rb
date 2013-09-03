require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Readable < Formula
  homepage 'http://readable.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/readable/readable-0.9.2.tar.gz'
  sha1 '273a7589f69fc82990dc4591eff1d4ab049edff1'

  depends_on 'guile'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "echo 123 | #{bin}/sweeten"
    system "echo 123 | #{bin}/unsweeten"
    system "echo 123 | #{bin}/sweet-run"
    # there are other executables, but I won't test them
  end
end
