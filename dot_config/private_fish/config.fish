eval (/opt/homebrew/bin/brew shellenv)

set -x GPG_TTY (tty)

if status is-interactive
    # Commands to run in interactive sessions can go here
end

## vi bindings -------

fish_vi_key_bindings

# Enable command history search via fzf.                                    
function reverse_history_search                                    
  history | fzf --no-sort | read -l command                                    
  if test $command                                    
    commandline -rb $command                                    
  end                                    
end                                    
                                    
function fish_user_key_bindings                                    
  bind -M default / reverse_history_search                                    
end   

## vi bindings end ------

alias vi "nvim"
alias top "btm -b"

set -gx EDITOR nvim 

zoxide init fish | source

# pnpm
set -gx PNPM_HOME "/Users/nacho/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
