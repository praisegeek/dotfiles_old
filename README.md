# Neovim + Tmux Fullstack & ML Setup

This setup provides a fully functional Neovim and tmux configuration tailored for:
- Fullstack development (React, TypeScript, HTML, CSS)
- Flutter development with `fvm`
- Python & ML workflows

## 🧱 Features

### Neovim
- Plugin manager: `packer.nvim`
- LSP support via `mason`, `lspconfig`
- Autocomplete with `nvim-cmp`
- Flutter tools integration
- Treesitter highlighting
- Telescope file search
- File explorer with `NvimTree`
- Prettified UI with a custom theme

### Tmux
- Prefix: `Ctrl + Space`
- Grid layouts (t2, t3, t4)
- Pane navigation with arrow keys

## 💻 Setup

```bash
# 1. Unpack configs
unzip nvim_fullstack_ml_dotfiles.zip -d ~/

# 2. Install Packer (first time only)
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# 3. Start Neovim and install plugins
nvim +PackerSync

# 4. Set up a nerd font (e.g., FiraCode Nerd Font)
# Install: https://www.nerdfonts.com/font-downloads

# 5. Use a terminal that supports ligatures and Nerd Fonts (e.g., Alacritty, Kitty, iTerm2)

# 6. Optional: Set shell alias
echo "alias vim='nvim'" >> ~/.bashrc  # or ~/.zshrc
```

## 🎨 Theme

Uses `tokyonight.nvim` for a clean dev look. Make sure Nerd Fonts are installed for icons!

---

