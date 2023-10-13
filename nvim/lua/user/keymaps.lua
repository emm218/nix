vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<M-tab>',   '<cmd>bnext<CR>')
vim.keymap.set('n', '<M-S-tab>', '<cmd>bprev<CR>')
vim.keymap.set('n', '<leader>g', ':Git<space>')
vim.keymap.set('n', '<leader>q', '<cmd>bd<CR>')
vim.keymap.set('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>')
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<cr>')
