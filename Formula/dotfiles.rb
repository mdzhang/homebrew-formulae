require 'formula'

class Dotfiles < Formula
  desc 'mdzhang dotfiles'
  homepage 'https://github.com/mdzhang/dotfiles/'
  url 'https://github.com/mdzhang/dotfiles/archive/v0.0.1-beta.tar.gz'
  sha256 '7214a456ba7aa6a1ddada443fab44ca48f100b025dfe743038a94740218b3d7d'

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
