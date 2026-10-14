vim.pack.add { 'https://github.com/Mofiqul/vscode.nvim' }

require('vscode').setup {
  color_overrides = {
    vscLineNumber = '#B9B9B9',
  },
}

vim.cmd.colorscheme 'vscode'
