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

# Set the NVM directory
set -gx NVM_DIR "$HOME/.nvm"

# Load NVM if it exists
if test -s "$NVM_DIR/nvm.fish"
    source "$NVM_DIR/nvm.fish"
end

set --export PATH $HOME/.cargo/bin $PATH
# nvim version managed by bob
set -gx PATH /home/nacho/.local/share/bob/nvim-bin $PATH

alias cat "bat"
alias fd "fdfind"
alias top "btm -b"
alias vi "nvim"
alias rm="trash-put"

zoxide init fish | source

# pnpm
set -gx PNPM_HOME "/home/nacho/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
