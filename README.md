# Neovim Configuration in Lua

Welcome to my **Neovim Configuration**! This setup leverages Lua for a modern, high-performance coding experience, packed with essential plugins and optimized keybindings.

## 🚀 Installation

Clone this repository into your Neovim configuration directory:

```bash
git clone https://github.com/LeonWandruschka/nvim-lua-config.git ~/.config/nvim
```

## 📌 Prerequisites

Ensure you have the following dependencies installed:

- **Neovim** (Version 0.7.5 or higher)
- **Exuberant Ctags** (For tag generation)
- **JetBrains Nerd Font** ([Download here](https://www.nerdfonts.com/font-downloads))
- **clangd** (C/C++ language server support)
- **LLVM** (Includes `lldb` and `lldb-dap` for debugging)
- **Vim** (For backward compatibility with Vimscript configurations)

## 🌟 Featured Plugins

This configuration includes powerful plugins to enhance productivity:

- 📌 `alpha-nvim` - Customizable dashboard
- 🎨 `colorscheme` - Custom themes for a personalized look
- 🔍 `telescope.nvim` - Fuzzy file searching and previewing
- 📝 `treesitter` - Improved syntax highlighting
- 🔧 `nvim-lspconfig` - Language Server Protocol setup
- 🛠️ `none-ls.nvim` - Lightweight LSP alternative
- 📂 `nvim-tree` - File explorer
- 🛑 `dap.nvim` - Debug Adapter Protocol for debugging
- 📝 `neogen` - Generate Doxygen-style comments
- 🏷️ `tagbar` - Displays tags in a sidebar
- ✅ `todo-comments` - Highlights TODO/FIXME comments
- 🔗 `lazygit` - Git integration

## 🎮 Keybindings

Enhance your workflow with these shortcuts:

### General Keybindings

| Action | Keybinding |
|--------|-----------|
| **Leader Key** | `,` |
| **Hover for Function Info** | `I` |
| **Go to Definition** | `<leader>gd` |
| **Go to Last Cursor Position** | `<C-o>` |
| **Code Action** | `<leader>ca` |
| **Format Code** | `<leader>cf` |
| **Open File Explorer** | `<C-b>` |
| **Search Files** | `<C-p>` |
| **Search Text (Ripgrep)** | `<leader>g` |

### Debugging Keybindings

| Action | Keybinding |
|--------|-----------|
| **Run Build Task** | `<leader>bb` |
| **Add Breakpoint** | `<leader>db` |
| **Start Debugging** | `<leader>dc` |
| **Step Over** | `<leader>do` |
| **Step Into** | `<leader>di` |
| **Step Out** | `<leader>du` |
| **Toggle DAP UI** | `<leader>dut` |

### Git Keybindings

| Action | Keybinding |
|--------|-----------|
| **Open LazyGit** | `<leader>lg` |
| **Git Diff** | `<leader>gd` |
| **Git Commit** | `<leader>gc` |

### Copilot Keybindings

| Action | Keybinding |
|--------|-----------|
| **Enable Copilot** | `:Copilot setup` |
| **Accept Suggestion** | `<Right>` |

## 📁 Directory Structure

Understand the file tree for easy customization:

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

## 🐳 Running in Docker

You can try this configuration inside a **Docker container**:

```zsh
docker build -t neovim-config-test .
```

Run the container:

```zsh
docker run --rm -it neovim-config-test
```

To remove the image afterward:

```zsh
docker rmi neovim-config-test
```

---

🚀 **Enjoy your enhanced Neovim experience!** 🚀
