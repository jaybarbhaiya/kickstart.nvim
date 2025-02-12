return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    config = function()
      require('ibl').setup {
        indent = { char = '' },
        whitespace = {
          highlight = {
            'Whitespace',
          },
        },
        scope = { enabled = true },
      }
    end,
  },
}
