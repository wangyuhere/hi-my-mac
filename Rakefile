
desc "install dotfiles, sublime etc on the mac"
task :install do
  install_dotfiles
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

def install_dotfiles
  files = %w(
    oh-my-zsh/custom/plugins
    oh-my-zsh/custom/wangyuhere.zsh-theme
    gemrc
    gitconfig
    zshrc
  )
  files.each do |file|
    source = "#{ENV['PWD']}/dotfiles/#{file}"
    target = "#{ENV['HOME']}/.#{file}"

    ln_nfs source, target
  end
end
