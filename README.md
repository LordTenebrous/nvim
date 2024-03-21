# Neovim Configuration in Lua

This guide provides the steps to install and configure Neovim using Lua, enhancing your development environment with efficient plugins and keybindings.

## Installation

Clone the Neovim configuration repository to your `.config/nvim` directory:

```bash
git clone https://github.com/LeonWandruschka/nvim-lua-config.git ~/.config/nvim
```

## Prerequisites

Ensure the following dependencies are installed on your system:

- **Vim**: Required for backward compatibility with Vimscript configurations.
- **Neovim**: Version 0.7.5 or higher.
- **Exuberant Ctags**: Needed for tag generation in various plugins.
- **Jetbraisn Nerdfont** can be installed here: [Nerdfont.com](https://www.nerdfonts.com/font-downloads)

## Featured Plugins

This configuration includes a variety of plugins to enhance functionality:

- `autopairs`: Automatically pairs brackets and quotes.
- `colorscheme`: Enables custom color schemes for the editor.
- `completion`: Provides code completion features.
- `lsp-config`: Configures the Language Server Protocol for languages like Lua, C/C++, CMake, and Markdown.
- `treesitter`: Improves syntax highlighting and parsing.
- `telescope`: Offers fuzzy file finding, picking, previewing, and more.
- `nvim-tree`: A file explorer plugin.
- `lualine`: A status line plugin for Neovim.
- `none-ls`: A lightweight LSP alternative.
- `tagbar`: Displays tags in a sidebar for easy navigation.

## Keybindings

Customize your workflow with these keybindings:

- **Leader Key**: `,` (Customizable in `lua/core/keybindings.lua`)
- **Hover for Function Info**: `I` (Normal mode)
- **Go to Definition**: `<leader>gd` (Normal mode)
- **Code Action**: `<leader>ca` (Normal and Visual mode)
- **Format Code**: `<leader>cf` (Normal mode)
- **Toggle NvimTree**: `<C-b>` (Normal, Insert, and Visual mode)
- **Focus NvimTree**: `<C-f>` (Normal, Insert, and Visual mode)
- **Toggle Tagbar**: `<leader>tb` (Normal mode)
- **Close Tagbar**: `<leader>tc` (Normal mode)
- **Move in Insert Mode**: `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` (Insert mode)

**INFO**: clangd does currently not work for arm devices with mason!

## Directory Structure

Understand the filetree for easier customization:

```zsh
.
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── core
    │   ├── commands.lua
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins
        ├── autopairs.lua
        ├── colorscheme.lua
        ├── completion.lua
        ├── lsp-config.lua
        ├── lualine.lua
        ├── none-ls.lua
        ├── nvimtree.lua
        ├── startup.lua
        ├── tagbar.lua
        ├── telescope.lua
        └── treesitter.lua
```

## Try it with Docker

clone the repository and run the following command:

```zsh
docker build -t neovim-config-test .
```

Now that the dockercontainer is built, you can run the following command to start the container:

```zsh
docker run --rm -it neovim-config-test
```

To remove the image afterwards, run the following command:

```zsh
docker rmi neovim-config-test
```

