starship init fish | source
alias ls="lsd"
alias config='/usr/bin/git --git-dir=/home/faiz/.dotfiles/ --work-tree=/home/faiz'

thefuck --alias | source 
source ~/.asdf/asdf.fish

export RAILS_DB_HOST=localhost
export GPG_TTY=(tty)
