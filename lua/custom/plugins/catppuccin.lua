vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }

require('catppuccin').setup {
  flavour = 'auto',
  background = {
    light = 'latte',
    dark = 'mocha',
  },
  color_overrides = {
    mocha = {
      base = '#000000',
    },
    latte = {
      base = '#ffffff',
    },
  },
}

vim.cmd.colorscheme 'catppuccin'
