starship init fish | source
alias ls="lsd"
alias config='/usr/bin/git --git-dir=/home/faiz/.dotfiles/ --work-tree=/home/faiz'
alias gloh='git log --oneline -n 10'

thefuck --alias | source 
source ~/.asdf/asdf.fish

set -x LESS_TERMCAP_mb (printf "\033[1;32m")  
set -x LESS_TERMCAP_md (printf "\033[1;32m")  
set -x LESS_TERMCAP_me (printf "\033[0m")  
set -x LESS_TERMCAP_se (printf "\033[0m")  
set -x LESS_TERMCAP_so (printf "\033[1;33m")  
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[1;4;31m")  

export RAILS_DB_HOST=localhost
export GPG_TTY=(tty)
