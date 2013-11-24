require 'fileutils'
require './config/boot'

desc "install dotfiles, sublime etc on the mac"
task :install => [:link_dotfiles, :link_st3_packages] do
  FileUtils.mkdir_p HiMyMac.logs_path
end

desc "link dotfiles"
task :link_dotfiles do
  link_dotfiles
end

desc "link sublime text 3 packages"
task :link_st3_packages do
  link_st3_packages
end

desc "show hi-my-mac path"
task :show_path do
  puts HiMyMac.path
end

private

def run(cmd)
  puts "[Running] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def ln_nfs(source, target)
  if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
    puts "[Moving] #{target} to #{target}.backup"
    run %{ mv "#{target}" "#{target}.backup" }
  end

  run %{ ln -nfs "#{source}" "#{target}" }
end

def link_dotfiles
  files = %w(
    oh-my-zsh/custom/plugins
    oh-my-zsh/custom/wangyuhere.zsh-theme
    gemrc
    gitconfig
    powconfig
    vimrc
    vimrc.bundles
    zshrc
  )
  files.each do |file|
    source = File.join HiMyMac.dotfiles_path, file
    target = File.join ENV['HOME'], ".#{file}"

    ln_nfs source, target
  end
end

def link_st3_packages
  source = File.join HiMyMac.sublime_path, 'Packages'
  target = '~/Library/Application\ Support/Sublime\ Text\ 3/Packages'
  run %{ mv #{target} #{target}.backup }
  run %{ ln -nfs #{source} #{target} }
end
