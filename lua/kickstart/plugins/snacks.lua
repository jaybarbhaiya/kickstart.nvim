---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

-- ============================================================
-- SECTION 5: SEARCH & NAVIGATION
-- Snacks picker, keymaps, LSP picker mappings
-- ============================================================
do
  vim.pack.add { gh 'folke/snacks.nvim', gh 'nvim-tree/nvim-web-devicons' }

  require('snacks').setup {
    explorer = { enabled = true },
    lazygit = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
       __ ____             _          
      / // __ )____ _   __(_)___ ___  
 __  / // __  / __ \ | / / / __ `__ \ 
/ /_/ // /_/ / / / / |/ / / / / / / / 
\____//_____/_/ /_/|___/_/_/ /_/ /_/  
]],
      },
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1, padding = 1 },
        -- { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        -- { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
      },
    },
    picker = {
      enabled = true,
      ui_select = true,
      sources = {
        explorer = {
          hidden = true,
          ignored = false,
          exclude = { '.git' },
          win = { list = { keys = { ['\\'] = 'close' } } },
        },
      },
    },
  }

  local picker = Snacks.picker

  vim.keymap.set('n', '\\', function() Snacks.explorer.reveal() end, { desc = 'Explorer reveal', silent = true })

  vim.keymap.set('n', '<leader>gg', function() Snacks.lazygit() end, { desc = 'Open LazyGit' })

  vim.keymap.set('n', '<leader>sh', function() picker.help() end, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sk', function() picker.keymaps() end, { desc = '[S]earch [K]eymaps' })
  vim.keymap.set('n', '<leader>sf', function() picker.files { hidden = true, layout = 'ivy', preview = false } end, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>sG', function() picker.git_files { layout = 'ivy', preview = false } end, { desc = '[S]earch [G]it files' })
  vim.keymap.set('n', '<leader>sb', function() picker.pickers() end, { desc = '[S]earch [B]uiltin Pickers' })
  vim.keymap.set({ 'n', 'v' }, '<leader>sw', function() picker.grep_word { hidden = true } end, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sg', function() picker.grep { hidden = true, layout = 'ivy' } end, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sd', function() picker.diagnostics() end, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>sr', function() picker.resume() end, { desc = '[S]earch [R]esume' })
  vim.keymap.set('n', '<leader>s.', function() picker.recent() end, { desc = '[S]earch Recent Files ("." for repeat)' })
  vim.keymap.set('n', '<leader>sc', function() picker.commands() end, { desc = '[S]earch [C]ommands' })
  vim.keymap.set('n', '<leader><leader>', function() picker.buffers { layout = 'ivy', preview = false } end, { desc = '[ ] Find existing buffers' })
  vim.keymap.set('n', '<leader>gc', function() picker.git_log() end, { desc = 'Search [g]it [c]ommits' })
  vim.keymap.set('n', '<leader>gb', function() picker.git_branches() end, { desc = '[G]it [B]ranches' })
  vim.keymap.set('n', '<leader>gs', function() picker.git_status() end, { desc = '[G]it [S]tatus' })
  vim.keymap.set('n', '<leader>gS', function() picker.git_stash() end, { desc = '[G]it [S]tash' })
  vim.keymap.set('n', '<leader>gd', function() picker.git_diff() end, { desc = '[G]it [D]iff (hunks)' })
  vim.keymap.set('n', '<leader>gl', function() picker.git_log_line() end, { desc = '[G]it [L]og line' })
  vim.keymap.set('n', '<leader>gf', function() picker.git_log_file() end, { desc = '[G]it log [F]ile' })
  vim.keymap.set({ 'n', 'v' }, '<leader>go', function() Snacks.gitbrowse() end, { desc = '[G]it [O]pen in browser' })
  vim.keymap.set('n', '<leader>gB', function() Snacks.git.blame_line() end, { desc = '[G]it [B]lame line' })

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('snacks-lsp-attach', { clear = true }),
    callback = function(event)
      local buf = event.buf
      vim.keymap.set('n', 'gr', function() picker.lsp_references() end, { buffer = buf, desc = '[G]oto [R]eferences' })
      vim.keymap.set('n', 'gri', function() picker.lsp_implementations() end, { buffer = buf, desc = '[G]oto [I]mplementation' })
      vim.keymap.set('n', 'gd', function() picker.lsp_definitions() end, { buffer = buf, desc = '[G]oto [D]efinition' })
      vim.keymap.set('n', 'ss', function() picker.lsp_symbols() end, { buffer = buf, desc = 'Open Document Symbols' })
      vim.keymap.set('n', 'gW', function() picker.lsp_workspace_symbols() end, { buffer = buf, desc = 'Open Workspace Symbols' })
      vim.keymap.set('n', 'gt', function() picker.lsp_type_definitions() end, { buffer = buf, desc = '[G]oto [T]ype Definition' })
    end,
  })

  vim.keymap.set('n', '<leader>/', function() picker.lines { layout = 'select' } end, { desc = '[/] Fuzzily search in current buffer' })
  vim.keymap.set('n', '<leader>s/', function() picker.grep_buffers() end, { desc = '[S]earch [/] in Open Files' })
  vim.keymap.set('n', '<leader>sn', function() picker.files { cwd = vim.fn.stdpath 'config' } end, { desc = '[S]earch [N]eovim files' })
end
