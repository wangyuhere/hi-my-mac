# personal oh-my-zsh plugin

unsetopt correct_all

export PATH="$(dirname $0)/bin:$PATH"

alias hi-my-mac='st ~/Projects/hi-my-mac'
alias p='cd ~/Projects'

function solr {
  cd ~/Projects/solr
  ./start.sh $1
  cd -
}
