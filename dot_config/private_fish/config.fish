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

alias cat "bat"
alias top "btm -b"
alias vi "nvim"
alias rm="trash-put"

if command -q nix-your-shell
  nix-your-shell fish | source
end

zoxide init fish | source
