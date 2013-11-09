# personal oh-my-zsh plugin

unsetopt correct_all

export PATH="$(dirname $0)/bin:$PATH"

alias hi-my-mac='st ~/Projects/hi-my-mac'
alias p='cd ~/Projects'
alias b="bundle"
alias gi="gem install"
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"
alias s="rspec"

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^P" history-search-backward

function solr {
  cd ~/Projects/solr
  ./start.sh $1
  cd -
}
