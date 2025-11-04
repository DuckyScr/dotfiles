-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ~/.config/nvim/lua/config/autocmds.lua
vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    -- If there are no listed buffers left, open the LazyVim dashboard
    if #vim.fn.getbufinfo({ buflisted = 1 }) == 0 then
      vim.cmd("Alpha") -- opens LazyVim start screen (or 'Dashboard' for older versions)
    end
  end,
})
