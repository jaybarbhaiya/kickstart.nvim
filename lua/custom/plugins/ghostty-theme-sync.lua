vim.pack.add { 'https://github.com/landerson02/ghostty-theme-sync.nvim' }

require('ghostty-theme-sync').setup {
  -- Path to your Ghostty config file
  ghostty_config_path = '~/.config/ghostty/config',

  -- If you want to keep the nvim colorscheme change (like the ghostty change),
  -- set this to true and point the config path to your config file that contains
  -- a line of the form: `vim.cmd.colorscheme('<colorscheme>')`
  -- The plugin will change this line to the selected theme
  persist_nvim_theme = true,
  nvim_config_path = '~/.config/nvim/init.lua',
}
