return {
    'neovim/nvim-lspconfig',
    config = function()
        require('lspconfig').rust_analyzer.setup{}
        require('lspconfig').clangd.setup{}
        
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
        
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>=', function() 
                    vim.lsp.buf.format { async = true } 
                end, opts)
            end,
        })
    end,
}
