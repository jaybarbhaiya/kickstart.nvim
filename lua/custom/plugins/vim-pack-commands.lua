-- Updates the installed packages.
-- Example usage:
-- :PackUpdate
vim.api.nvim_create_user_command("PackUpdate", function()
  vim.pack.update()
end, {})

-- Deletes the specified packages.
-- Exmaple ussage:
-- :PackDel mini.nvim telescope.nvim
vim.api.nvim_create_user_command("PackDel", function(opts)
  local plugins = vim.split(opts.args, "%s+", { trimempty = true })

  if #plugins == 0 then
    vim.notify("Usage: :PackDel plugin1 [plugin2 ...]", vim.log.levels.ERROR)
    return
  end

  vim.pack.del(plugins)
end, {
  nargs = "+",
  complete = function()
    -- Optional: return installed package names for completion
    return {}
  end,
})
