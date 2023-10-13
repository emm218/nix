local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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
  { import = 'user.plugins.dracula' },
  { import = 'user.plugins.treesitter' },
  { import = 'user.plugins.fzf' },
  { 'ap/vim-buftabline' },
  { 'tpope/vim-fugitive' },
  { 'jessarcher/vim-heritage' },
  { 'numToStr/Comment.nvim', lazy = false, config = function() require('Comment').setup() end },
})
