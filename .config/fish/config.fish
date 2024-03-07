if status is-interactive
    starship init fish | source
    alias ls="lsd -A"
    alias gloh='git log --oneline -n 10'
    alias asrp='asdf reshim python'
    alias wh='wormhole'
    alias py='bpython'
    alias efish='source ~/.config/fish/config.fish'
    alias vifish='vi ~/.config/fish/config.fish'
    alias gofish='vi ~/.config/fish/config.fish; source ~/.config/fish/config.fish'
    alias venv='source venv/bin/activate.fish 2>/dev/null || source .venv/bin/activate.fish'
    alias dvenv='deactivate'
    alias bi='brew install'
    alias bic='brew install --cask'
    alias bs='brew search'
    alias g='git'
    alias ucom='uv pip compile -o requirements.txt requirements.in'
    alias upi='uv pip install'
    alias upir='uv pip install -r requirements.txt'
    alias pi='pip install'
    alias pipir='pip install -r requirements.txt'
    alias pipu='pip install --upgrade'
    alias pipup='pip install --upgrade pip'
    alias gitconfig='vi ~/.gitconfig'
    alias untar='tar -xvzf'
    alias countloc='git ls-files | grep ".*\.\(ts\|tsx\|js\|jsx\|py\|md\)\$" | grep -v "webpack" | xargs wc -l | sort -n'
    alias ppython='PYTHONPATH=. python $argv'

    function ppid
        lsof -ti:$argv
    end
 end

switch (uname)
	case Linux
        	source ~/.asdf/asdf.fish
                alias config='/usr/bin/git --git-dir=/home/faiz/.dotfiles/ --work-tree=/home/faiz'
                # opam configuration
                source /home/faiz/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
	case Darwin
                set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /Users/faiz/.ghcup/bin $PATH # ghcup-env
                set -U fish_user_paths /opt/homebrew/bin $fish_user_paths

		source /opt/homebrew/opt/asdf/libexec/asdf.fish
                alias config='/usr/bin/git --git-dir=/Users/faiz/.cfg --work-tree=/Users/faiz'
                fish_add_path /opt/homebrew/opt/llvm@11/bin
                fish_add_path '/Applications/Racket v8.3/bin'
                fish_add_path '/Users/faiz/.local/bin'
                fish_add_path '/Users/faiz/.cargo/bin'
                [ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish
	end

set -x LESS_TERMCAP_mb (printf "\033[1;32m")  
set -x LESS_TERMCAP_md (printf "\033[1;32m")  
set -x LESS_TERMCAP_me (printf "\033[0m")  
set -x LESS_TERMCAP_se (printf "\033[0m")  
set -x LESS_TERMCAP_so (printf "\033[1;33m")  
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[1;4;31m")  

fish_vi_key_bindings

export GPG_TTY=(tty)

#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/faiz/.ghcup/bin # ghcup-env

