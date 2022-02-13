starship init fish | source
alias ls="lsd -A"
alias gloh='git log --oneline -n 10'
alias jw='fuck --yeah'
alias asrp='asdf reshim python'
alias wh='wormhole'

thefuck --alias | source 

function ppid
    lsof -ti:$argv
end

switch (uname)
	case Linux
        	source ~/.asdf/asdf.fish
                alias config='/usr/bin/git --git-dir=/home/faiz/.dotfiles/ --work-tree=/home/faiz'
                # opam configuration
                source /home/faiz/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
	case Darwin
                set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
		source /opt/homebrew/opt/asdf/libexec/asdf.fish
                alias config='/usr/bin/git --git-dir=/Users/faiz/.cfg --work-tree=/Users/faiz'
                fish_add_path /opt/homebrew/opt/llvm@11/bin
                fish_add_path '/Applications/Racket v8.3/bin'
	end

set -x LESS_TERMCAP_mb (printf "\033[1;32m")  
set -x LESS_TERMCAP_md (printf "\033[1;32m")  
set -x LESS_TERMCAP_me (printf "\033[0m")  
set -x LESS_TERMCAP_se (printf "\033[0m")  
set -x LESS_TERMCAP_so (printf "\033[1;33m")  
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[1;4;31m")  

export GPG_TTY=(tty)


