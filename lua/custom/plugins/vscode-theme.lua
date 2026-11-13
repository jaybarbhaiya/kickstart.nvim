vim.pack.add { 'https://github.com/Mofiqul/vscode.nvim' }

-- Reconfigure before each load so overrides follow automatic background changes.
vim.api.nvim_create_autocmd('ColorSchemePre', {
  group = vim.api.nvim_create_augroup('VscodeThemeOverrides', { clear = true }),
  pattern = 'vscode',
  callback = function()
    local dark = vim.o.background == 'dark'
    local background = dark and '#000000' or '#FFFFFF'
    local border = dark and '#808080' or '#606060'

    require('vscode').setup {
      transparent = false,
      color_overrides = {
        vscBack = background,
        vscPopupBack = background,
        vscTabCurrent = background,
        vscSplitDark = border,
        vscLineNumber = '#B9B9B9',
      },
      group_overrides = {
        FloatBorder = { fg = border, bg = background },
      },
    }
  end,
})

vim.cmd.colorscheme 'vscode'
