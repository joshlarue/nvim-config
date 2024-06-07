local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "akinsho/bufferline.nvim",
  "tpope/vim-fugitive",
  "Exafunction/codeium.nvim",
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' } }
  },
  "lewis6991/gitsigns.nvim",
  "brenoprata10/nvim-highlight-colors",
  "windwp/nvim-ts-autotag",
  "RRethy/vim-illuminate",
  "lewis6991/hover.nvim",
  "plenary.nvim",
  "prettier/vim-prettier",
  "stevearc/conform.nvim",
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  "nvim-treesitter/nvim-treesitter",
  "L3MON4D3/LuaSnip",
  'saadparwaiz1/cmp_luasnip',
  "morhetz/gruvbox",
  "MunifTanjim/prettier.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "m4xshen/autoclose.nvim",
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",              -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  {
    "onsails/lspkind.nvim",
    event = { "VimEnter" },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
      "hrsh7th/cmp-buffer",   -- buffer auto-completion
      "hrsh7th/cmp-path",     -- path auto-completion
      "hrsh7th/cmp-cmdline",  -- cmdline auto-completion
    },
  },
})

require("autoclose").setup()
require("ibl").setup()
require("nvim-highlight-colors").setup({})

vim.cmd("colorscheme gruvbox")
vim.cmd("packloadall")
vim.opt.termguicolors = true
