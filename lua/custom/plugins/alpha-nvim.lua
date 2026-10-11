vim.pack.add {
  { src = 'https://github.com/goolord/alpha-nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
}

local alpha = require 'alpha'
local theme = require 'alpha.themes.startify'

-- Apply the configuration
alpha.setup(theme.config)
