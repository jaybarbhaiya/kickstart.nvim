vim.pack.add { 'https://github.com/catppuccin/nvim' }

require('catppuccin').setup {
  no_italic = true,
}

if vim.o.background == 'dark' then
  vim.cmd.colorscheme 'catppuccin-mocha'
else
  vim.cmd.colorscheme 'catppuccin-latte'
end
