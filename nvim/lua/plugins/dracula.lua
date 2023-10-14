return {
  'Mofiqul/dracula.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    transparent_bg = true,
    overrides = function(colors) return {
      TabLineFill = { bg = colors.none },
      StatusLine  = { bg = colors.none },
    } end,
  },
  config = function (plugin, opts)
    require('dracula').setup(opts)

    vim.cmd('colorscheme dracula')
  end,
}
