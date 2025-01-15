-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'saecki/crates.nvim',
    ft = { 'rust', 'toml' },
    config = function(_, opts)
      local crates = require 'crates'
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    'github/copilot.vim',
  },
  {
    'nvim-java/nvim-java',
    config = function()
      require('java').setup()
      require('lspconfig').jdtls.setup {}
    end,
  },
}
