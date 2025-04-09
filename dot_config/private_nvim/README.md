# nvim config

- neovim version managed with [bob](https://github.com/MordechaiHadad/bob)
- working with `NVIM v0.9.5`

## Structure

```
.
├── init.lua                  # Entry point
├── lua/
│   ├── core/                 # Core configuration
│   │   ├── functions.lua     # Custom functions
│   │   ├── init.lua          # Core initialization
│   │   ├── keymaps.lua       # Key mappings
│   │   └── settings.lua      # Neovim settings
│   └── plugins/              # Plugin configurations (lazy.nvim)
│       ├── autopairs.lua
│       ├── comment.lua
│       ├── gitsigns.lua
│       ├── harpoon.lua
│       ├── leap.lua
│       ├── lsp-zero.lua
│       ├── lualine.lua
│       ├── nvim-ts-autotag.lua
│       ├── oil.lua
│       ├── project.lua
│       ├── pytest.lua
│       ├── ruff.lua
│       ├── swenv.lua
│       ├── telescope.lua
│       ├── tokyonight.lua
│       ├── treesitter.lua
│       ├── undotree.lua
│       ├── which-key.lua
│       └── zen-mode.lua
```

Each plugin has its own file in the `plugins/` directory, loaded by lazy.nvim.
