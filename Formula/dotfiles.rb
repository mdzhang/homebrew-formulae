require 'formula'

class Dotfiles < Formula
  desc 'mdzhang dotfiles'
  homepage 'https://github.com/mdzhang/dotfiles/'
  url 'https://github.com/mdzhang/dotfiles/archive/v0.0.1-gamma.tar.gz'
  sha256 '3c02f3765a446fd718acdabe73ca1e77e0a3539bae9f755dc54c858dfa2e6292'

  depends_on 'thoughtbot/formulae/rcm'

  head 'https://github.com/mdzhang/dotfiles.git'

  bottle :unneeded

  def install
    prefix.install Dir["*"]
    system "env", "RCRC=#{prefix}/rcrc", "DOT_PATH=#{prefix}", "rcup"
  end

  test do
    system "bash", "-c" "\"if [ -z ${RCRC} ]; then false; else true; fi\""
  end
end
