require 'formula'

class Dotfiles < Formula
  SYSTEM_RUBY_PATH = '/usr/bin/ruby'
  HOMEBREW_RUBY_PATH = "#{HOMEBREW_PREFIX}/bin/ruby"

  homepage 'https://github.com/mdzhang/dotfiles/'
  url 'https://github.com/mdzhang/dotfiles/archive/v0.0.1-alpha.tar.gz'
  sha256 '510a1bb480862a73c9a1ea98f521ef11d5dd8fbdfe9feb73f8bd237ebaba5af8'

  def self.old_system_ruby?
    system_ruby_version = `#{SYSTEM_RUBY_PATH} -e "puts RUBY_VERSION"`.chomp
    system_ruby_version < '2.0.0'
  end

  if old_system_ruby?
    depends_on 'Ruby'
  end
  depends_on 'readline'

  def install
    set_ruby_path
    set_architecture
    system "env", "RCRC=$HOME/.dotfiles/rcrc", "rcup"
  end

  test do
    # system "#{bin}/gitsh", "--version"
  end

  private

  def set_ruby_path
    if self.class.old_system_ruby? || File.exist?(HOMEBREW_RUBY_PATH)
      ENV['RUBY'] = HOMEBREW_RUBY_PATH
    else
      ENV['RUBY'] = SYSTEM_RUBY_PATH
    end
  end
end
