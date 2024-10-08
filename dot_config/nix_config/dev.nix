{ pkgs, ... }:

# All the dev tools that I use inside the terminal 
{
  home.packages = with pkgs; [

    # dotfile manager
    chezmoi

    # fish dependency
    fish
    zoxide

    # git
    delta

    # general utilities
    trash-cli
    tmux
    tldr
    bat
    tree
    fzf
    ripgrep
    fd
    bottom
    direnv
    zellij

    # containers
    podman
    distrobox

    # neovim dependency
    neovim
    luarocks
    jre17_minimal
    nodejs_22
    tree-sitter
    marksman
    wl-clipboard # wayland clipboard
    xclip # X-server clipboard


    #visidata
  ];
}
