return {
    'ibhagwan/fzf-lua',
    keys = {
        { '<leader>f', "<cmd>lua require('fzf-lua').files()<CR>", silent = true } 
    },
    config = function()
        require("fzf-lua").setup({
            winopts = { 
                border = 'single',
                width = 1.0,
                height = 0.2,
                row = 1.0,
                col = 0.0,
                preview = { hidden = 'hidden' },
            },
            fzf_opts = {
                ['--color'] = 'color=16,fg:white,border:white,pointer:magenta,fg+:magenta',
                ['--layout'] = 'default',
                ['--info'] = 'inline',
            },
        })
    end
}
