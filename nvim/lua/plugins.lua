return {
  { import = 'plugins.cmp' },
  { import = 'plugins.dracula' },
  { import = 'plugins.treesitter' },
  { import = 'plugins.fzf' },
  { import = 'plugins.lspconfig' },
  { 'ap/vim-buftabline' },
  { 'windwp/nvim-autopairs', event = "InsertEnter" },
  { 'tpope/vim-fugitive' },
  { 'jessarcher/vim-heritage' },
  { 'numToStr/Comment.nvim', lazy = false, config = function() require('Comment').setup() end }, 
}
