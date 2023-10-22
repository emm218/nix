vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<M-tab>',   '<cmd>bnext<CR>')
vim.keymap.set('n', '<M-S-tab>', '<cmd>bprev<CR>')
vim.keymap.set('n', '<leader>g', ':Git<space>')
vim.keymap.set('n', '<leader>q', '<cmd>bd<CR>')

-- Quickly clear search highlighting.
vim.keymap.set('n', '<leader>k', ':nohlsearch<CR>')

-- Allow gf to open non-existent files.
vim.keymap.set('', 'gf', ':edit <cfile><CR>')

-- Disable annoying command line thing.
vim.keymap.set('n', 'q:', ':q<CR>')
