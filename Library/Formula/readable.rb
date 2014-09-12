require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Readable < Formula
  homepage 'http://readable.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/readable/readable-0.9.2.tar.gz'
  sha1 '273a7589f69fc82990dc4591eff1d4ab049edff1'

  depends_on 'guile'
  depends_on 'clisp' # TODO or 'sbcl', or possibly other distributions - see readable's Makefile for what it *really* requires

  def install
    # TODO detect if clisp and ASDF are already installed, and if so, configure readable to have support for them
    system "./configure", "--without-clisp",
                          "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def caveats
    "This formula does not install the Common Lisp version, because Homebrew currently cannot install ASDF if it is not installed."
  end

  def test
    system "echo 123 | #{bin}/sweeten"
    system "echo 123 | #{bin}/unsweeten"
    system "echo 123 | #{bin}/sweet-run"
    # there are other executables, but I won't test them
  end
end
