-- Neovim Config for Fullstack + ML

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Install Plugins via packer
require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  use "nvim-telescope/telescope.nvim"
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "nvim-treesitter/nvim-treesitter"
  use "akinsho/flutter-tools.nvim"
  use "onsails/lspkind.nvim"
  use "windwp/nvim-autopairs"
  use "folke/tokyonight.nvim"
end)

-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "tsserver", "eslint", "html", "cssls", "lua_ls", "emmet_ls", "ruff_lsp" }
})

-- LSP
local lspconfig = require("lspconfig")
local on_attach = function(_, bufnr)
  local map = function(keys, func) vim.keymap.set("n", keys, func, { buffer = bufnr }) end
  map("<C-Space>ca", vim.lsp.buf.code_action)
  map("gd", vim.lsp.buf.definition)
  map("gi", vim.lsp.buf.implementation)
  map("gr", vim.lsp.buf.references)
end

for _, server in ipairs({ "pyright", "tsserver", "eslint", "html", "cssls", "lua_ls", "emmet_ls", "ruff_lsp" }) do
  lspconfig[server].setup({ on_attach = on_attach })
end

-- Flutter Tools
require("flutter-tools").setup({
  lsp = { on_attach = on_attach },
  flutter_path = "fvm flutter"
})

-- Autocomplete
local cmp = require("cmp")
cmp.setup({
  snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true })
  }),
  sources = { { name = "nvim_lsp" }, { name = "luasnip" } },
  formatting = {
    format = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })
  }
})

-- Treesitter
require("nvim-treesitter.configs").setup {
  ensure_installed = { "python", "typescript", "tsx", "javascript", "html", "css", "lua" },
  highlight = { enable = true },
  indent = { enable = true }
}

-- NvimTree
require("nvim-tree").setup({
  view = { width = 35 },
  filters = { dotfiles = false }
})
vim.keymap.set("n", "fa", ":NvimTreeCreateFile<CR>")
vim.keymap.set("n", "fs", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<space>ff", "<cmd>Telescope find_files<cr>")

-- Auto Pairs
require("nvim-autopairs").setup()

-- Window Navigation (prefix = Ctrl+Space)
vim.keymap.set("n", "<C-Space><Left>", "<C-w>h")
vim.keymap.set("n", "<C-Space><Right>", "<C-w>l")
vim.keymap.set("n", "<C-Space><Up>", "<C-w>k")
vim.keymap.set("n", "<C-Space><Down>", "<C-w>j")

-- Alias vim as nvim
vim.cmd("command! vim :e")

-- Optional: format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    vim.lsp.buf.format({ async = true })
  end
})

require("theme")
