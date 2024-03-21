# Get neovim 0.9.5 source build
FROM lewan07/neovim_0.9.5:latest

# Install Neovim configuration
RUN git clone https://github.com/LeonWandruschka/nvim-lua-config.git ~/.config/nvim

# Working directory
WORKDIR /app

