if status is-interactive
    starship init fish | source
    alias u="uv run"
    alias c="claude --dangerously-skip-permissions"
    alias jt="just"
    alias pn="pnpm"
    alias ls="lsd -A"
    alias cless="csvlens"
    alias gloh='git log --oneline -n 10'
    alias grao='git remote add origin'
    alias wh='wormhole --transit-helper=tcp:relay.soc220014.projects.jetstream-cloud.org:4001'
    alias py='bpython'
    alias efish='source ~/.config/fish/config.fish'
    alias vifish='vi ~/.config/fish/config.fish'
    alias gofish='vi ~/.config/fish/config.fish; source ~/.config/fish/config.fish'
    alias venv='source .venv/bin/activate.fish 2>/dev/null || source backend/.venv/bin/activate.fish'
    alias dvenv='deactivate'
    alias bi='brew install'
    alias bic='brew install --cask'
    alias bs='brew search'
    alias g='git'
    alias us='uv sync'
    alias usu='uv sync -U'
    alias ucom='uv pip compile -o requirements.txt requirements.in'
    alias upi='uv pip install'
    alias upir='uv pip install -r requirements.txt'
    alias upied='uv pip install -e .'
    alias pi='pip install'
    alias pipir='pip install -r requirements.txt'
    alias pipu='pip install --upgrade'
    alias pipup='pip install --upgrade pip'
    alias pcr='pre-commit run --all-files'
    alias pcra='git aa && pre-commit run --all-files'
    alias gcon='vi ~/.gitconfig'
    alias untar='tar -xvzf'
    alias countloc='git ls-files | grep ".*\.\(ts\|tsx\|js\|jsx\|py\|md\|css\|fish\|bash\|sh\|conf\|ini\|ya?ml\)\$" | grep -v "webpack" | grep -v ".gen.ts" | grep -v "pnpm-lock" | grep -v "/components/ui/" | xargs wc -l | sort -n'
    alias ppython='PYTHONPATH=. python $argv'
    alias ta='tmux a'
    alias tat='tmux a -t'
    alias t='tmux a -t'
    alias tls='tmux list-sessions'
    alias trs='tmux rename-session -t'
    alias dc='docker compose'
    alias dcu='docker compose up'
    alias dcd='docker compose down'
    alias dcl='docker compose logs'
    alias cl='claude'
    alias s='ssh poirot'

    function ppid
        lsof -ti:$argv
    end
    function st
        ssh poirot -t "tmux a -t $argv"
    end
    function countf
        find $argv -type f | wc -l
    end
 end

switch (uname)
    case Linux
        set -gx PATH /home/faiz/.local/bin $PATH
        set -gx PATH /home/faiz/.cargo/bin $PATH
        set -gx PATH /home/faiz/scripts $PATH
        set -Ux RESTIC_PASSWORD_FILE /home/faiz/.config/restic/r2.password
        set -Ux RESTIC_REPOSITORY rclone:r2:/faiz/backups
        alias config='/usr/bin/git --git-dir=/home/faiz/.cfg/ --work-tree=/home/faiz'
        alias cfg='config'
        # opam configuration
        source /home/faiz/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
        if test -f /home/faiz/.autojump/share/autojump/autojump.fish; . /home/faiz/.autojump/share/autojump/autojump.fish; end
        eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

        # pnpm
        set -gx PNPM_HOME "/home/faiz/.local/share/pnpm"
        if not string match -q -- $PNPM_HOME $PATH
          set -gx PATH "$PNPM_HOME" $PATH
        end
        # pnpm end

        if test -e /home/faiz/.config/fish/private.fish
            source /home/faiz/.config/fish/private.fish
        end
        zoxide init fish | source
        direnv hook fish | source

    case Darwin
        set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
        set -gx PATH $HOME/.cabal/bin /Users/faiz/.ghcup/bin $PATH # ghcup-env
        set -gx PATH /opt/homebrew/bin $PATH
        set -Ux RESTIC_PASSWORD_FILE /Users/faiz/.config/restic/r2.password

        alias config='/usr/bin/git --git-dir=/Users/faiz/.cfg --work-tree=/Users/faiz'
        alias cfg='config'
        set -gx PATH /opt/homebrew/opt/llvm@11/bin $PATH
        set -gx DYLD_LIBRARY_PATH /opt/homebrew/lib $DYLD_LIBRARY_PATH
        set -gx PATH '/Applications/Racket v8.3/bin' $PATH
        set -gx PATH /Users/faiz/.local/bin $PATH
        set -gx PATH /Users/faiz/.cargo/bin $PATH
        test -f /opt/homebrew/share/autojump/autojump.fish; and source /opt/homebrew/share/autojump/autojump.fish
        set -gx PATH /opt/homebrew/opt/python@3.11/bin $PATH
        set -U fish_user_paths "/Users/faiz/Library/Application Support/uv/python/cpython-3.11.9-macos-aarch64-none/bin" $fish_user_paths

        fnm env | source
        # pnpm
        set -gx PNPM_HOME "/Users/faiz/Library/pnpm"
        if not string match -q -- $PNPM_HOME $PATH
          set -gx PATH "$PNPM_HOME" $PATH
        end
        # pnpm end
    end

set -x LESS_TERMCAP_mb (printf "\033[1;32m")  
set -x LESS_TERMCAP_md (printf "\033[1;32m")  
set -x LESS_TERMCAP_me (printf "\033[0m")  
set -x LESS_TERMCAP_se (printf "\033[0m")  
set -x LESS_TERMCAP_so (printf "\033[1;33m")  
set -x LESS_TERMCAP_ue (printf "\033[0m")
set -x LESS_TERMCAP_us (printf "\033[1;4;31m")  

set -x CLAUDE_CODE_DISABLE_FEEDBACK_SURVEY 1
set -x CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC 1

fish_vi_key_bindings

export GPG_TTY=(tty)

