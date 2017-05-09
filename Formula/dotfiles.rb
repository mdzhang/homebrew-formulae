require 'formula'

class Dotfiles < Formula
  desc 'mdzhang dotfiles'
  homepage 'https://github.com/mdzhang/dotfiles/'
  url 'https://github.com/mdzhang/dotfiles/archive/v0.0.1-alpha.tar.gz'
  sha256 '510a1bb480862a73c9a1ea98f521ef11d5dd8fbdfe9feb73f8bd237ebaba5af8'

  depends_on 'thoughtbot/formulae/rcm'

  def install
    system "env", "RCRC=#{prefix}/rcrc", "rcup"
  end

  test do
    system "bash", "-c" "\"if [ -z ${RCRC} ]; then false; else true; fi\""
  end
end
