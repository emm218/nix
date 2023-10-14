return {
  { import = 'plugins.dracula' },
  { import = 'plugins.treesitter' },
  { import = 'plugins.fzf' },
  { import = 'plugins.lspconfig' },
  { 'ap/vim-buftabline' },
  { 'tpope/vim-fugitive' },
  { 'jessarcher/vim-heritage' },
  { 'numToStr/Comment.nvim', lazy = false, config = function() require('Comment').setup() end }, 
}
