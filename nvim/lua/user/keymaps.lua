vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<M-tab>',   '<cmd>bnext<CR>')
vim.keymap.set('n', '<M-S-tab>', '<cmd>bprev<CR>')
vim.keymap.set('n', '<leader>g', ':Git<space>')
vim.keymap.set('n', '<leader>q', '<cmd>bd<CR>')
