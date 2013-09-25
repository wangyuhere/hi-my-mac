local begin_prompt='%{$terminfo[bold]$fg[yellow]%}王%{$reset_color%}'
local user_host='%{$terminfo[bold]$fg[blue]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[green]%} %~%{$reset_color%}'

local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[yellow]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[yellow]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi

local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}<"
ZSH_THEME_GIT_PROMPT_SUFFIX=">%{$reset_color%}"

local time_info='%{$fg[white]%}[%*]'

local end_prompt='%{$terminfo[bold]$fg[yellow]%}宇 %{$reset_color%}'

PROMPT="${begin_prompt} ${user_host} ${current_dir} ${rvm_ruby} ${git_info} ${time_info}
${end_prompt}"
