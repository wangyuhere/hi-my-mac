# personal oh-my-zsh plugin

unsetopt correct_all

export PATH="$(dirname $0)/bin:$PATH"

alias hi-my-mac='st ~/Projects/hi-my-mac'
alias b="bundle"
alias gi="gem install"
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"
alias s="bundle exec rspec"
alias ss="bundle exec spring rspec"
alias rpry="pry -r ./config/environment"
alias t='smart_test'

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^P" history-search-backward

function p {
  cd ~/Projects/$1
}

function pe {
  st ~/Projects/$1
}
