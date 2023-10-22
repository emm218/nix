return {
    'neovim/nvim-lspconfig',
    config = function()
        require('lspconfig').rust_analyzer.setup{
            settings = {
                ['rust-analyzer'] = {
                    checkOnSave = {
                        command = 'clippy'
                    }
                }
            }
        }
        require('lspconfig').clangd.setup{}
        
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '<leader>[', vim.diagnostic.goto_prev)
        vim.keymap.set('n', '<leader>]', vim.diagnostic.goto_next)
        
        local augroup = vim.api.nvim_create_augroup('UserLspConfig', {})

        vim.api.nvim_create_autocmd('LspAttach', {
            group = augroup,
            callback = function(ev)
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<leader>R', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>=', function() 
                    vim.lsp.buf.format { async = true } 
                end, opts)
            
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = ev.buf,
                    callback = function(ev)
                        vim.lsp.buf.format({ bufnr = ev.buf })
                    end
                })
            end
        })

    end,
}
