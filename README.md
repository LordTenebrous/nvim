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
- **Jetbrains Nerdfont** can be installed here: [Nerdfont.com](https://www.nerdfonts.com/font-downloads)
- **ccls**: Required for C/C++ language server support.
- **llvm**: Required for debugging (lldb and lldb-dap)

## Featured Plugins

This configuration includes a variety of plugins to enhance functionality:

- `alpha-nvim`: A customizable dashboard for Neovim
- `autopairs`: Automatically pairs brackets and quotes.
- `colorscheme`: Enables custom color schemes for the editor.
- `completion`: Provides code completion features.
- `lazygit`: Integrates the lazygit terminal tool.
- `lsp-config`: Configures the Language Server Protocol for languages like Lua, C/C++, CMake, and Markdown.
- `lualine`: A status line plugin for Neovim.
- `neogen`: For doxygen comments.
- `none-ls`: A lightweight LSP alternative.
- `nvim-tree`: A file explorer plugin.
- `treesitter`: Improves syntax highlighting and parsing.
- `telescope`: Offers fuzzy file finding, picking, previewing, and more.
- `tagbar`: Displays tags in a sidebar for easy navigation.
- `todo-comments`: Highlights TODO, FIXME, and other annotations within code.
- `dap`: Debug Adapter Protocol for debugging.
- `dap-ui`: Debug Adapter Protocol UI for debugging.
- `dap-virtual-text`: Debug Adapter Protocol virtual text for debugging.
- `overseer`: Plugin to build and run code using .vscode/launch.json and .vscode/tasks.json configurations.

## Keybindings

Customize your workflow with these keybindings:

### General Keybindings
- **Leader Key**: `,` (Customizable in `lua/core/keybindings.lua`)
- **Hover for Function Info**: `I` (Normal mode)
- **Go to Definition**: `<leader>gd` (Normal mode)
- **Go to last cursor position** `<C-o>` (Normal mode)
- **Code Action**: `<leader>ca` (Normal and Visual mode)
- **Format Code**: `<leader>cf` (Normal mode)
- **Lazygit**: `<leader>lg` (Normal mode)
- **Doxygen Comments**: `<leader>nd` (Normal mode)
- **Code Formatting**: `<leader>cf` (Normal mode)
- **Toggle NvimTree**: `<C-b>` (Normal, Insert, and Visual mode)
- **Open Tagbar**: `<leader>tb` (Normal mode)
- **Close Tagbar**: `<leader>tc` (Normal mode)
- **Search Files**: `<C-p>` (Normal mode)
- **Search Text in Files**: `<leader>g` (Normal mode) (Uses ripgrep)
- **Move in Insert Mode**: `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>` (Insert mode)

### Debugging Keybindings
- **Run Build Task from tasks.json**: `<leader>bb` (Normal mode)
- **Add Breakpoint**: `<leader>db` (Normal mode)
- **Start/Continue debugging**: `<leader>dc` (Normal mode)
- **Step over**: `<leader>do` (Normal mode)
- **Step into**: `<leader>di` (Normal mode)
- **Step out**: `<leader>du` (Normal mode)
- **Set Breakpoint Condition**: `<leader>B` (Normal mode)
- **Set Logpoint message**: `<leader>lp` (Normal mode)
- **Open REPL**: `<leader>dr` (Normal mode)
- **Run Latest Debug Session**: `<leader>dl` (Normal mode)
- **Toggle DAP-UI**: `<leader>dut` (Normal mode)

### Microsoft Copilot Keybindings (and setup)
Copilot can be setup by running `:Copilot setup` inside nvim.
You can than follow the instructions shown to activate copilot.

- **Copilot suggestion completion**: `<Right>` (Insert mode)

## Directory Structure

Understand the filetree for easier customization:

```zsh
.
├── Dockerfile
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── core
    │   ├── colorscheme.lua
    │   ├── commands.lua
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins
        ├── alpha-nvim.lua
        ├── autopairs.lua
        ├── colorscheme.lua
        ├── completion.lua
        ├── debugging.lua
        ├── lazygit.lua
        ├── lsp-config.lua
        ├── lualine.lua
        ├── neogen.lua
        ├── none-ls.lua
        ├── nvimtree.lua
        ├── tagbar.lua
        ├── telescope.lua
        ├── todo_comments.lua
        └── treesitter.lua
```

## Try it with Docker

**INFO**: A new docker container will be made so the one shown below is obsolete.


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

