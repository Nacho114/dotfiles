# --------------------------------------------------------
# Homebrew environment setup (must be FIRST)
# --------------------------------------------------------
eval (/opt/homebrew/bin/brew shellenv)

# --------------------------------------------------------
# NVM (fish version) — ensure Node 20 is default
# --------------------------------------------------------
set -U nvm_default_version 20

# correct nvm.fish path  (~/.local/share/nvm, not ~/.nvm)
set -gx PATH $HOME/.local/share/nvm/v20.19.6/bin $PATH

# --------------------------------------------------------
# GPG
# --------------------------------------------------------
set -x GPG_TTY (tty)

# --------------------------------------------------------
# Interactive session setup
# --------------------------------------------------------
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# --------------------------------------------------------
# Vi Mode
# --------------------------------------------------------
fish_vi_key_bindings

# --------------------------------------------------------
# FZF Reverse History Search
# --------------------------------------------------------
function reverse_history_search
    history | fzf --no-sort | read -l command
    if test $command
        commandline -rb $command
    end
end

function fish_user_key_bindings
    bind -M default / reverse_history_search
end

# --------------------------------------------------------
# Yazi (file manager)
# --------------------------------------------------------
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# --------------------------------------------------------
# Aliases
# --------------------------------------------------------
alias vi "nvim"
alias top "btm -b"

# --------------------------------------------------------
# EDITOR
# --------------------------------------------------------
set -gx EDITOR nvim

# --------------------------------------------------------
# Tools: zoxide + starship
# --------------------------------------------------------
zoxide init fish | source
starship init fish | source

# --------------------------------------------------------
# pnpm
# --------------------------------------------------------
set -gx PNPM_HOME "/Users/nacho/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

# --------------------------------------------------------
# Google Cloud SDK path
# --------------------------------------------------------
if test -f '/opt/homebrew/share/google-cloud-sdk/path.fish.inc'
    . '/opt/homebrew/share/google-cloud-sdk/path.fish.inc'
end

fish_add_path $HOME/.local/bin
