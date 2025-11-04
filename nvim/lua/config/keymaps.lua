-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "q", function()
  if #vim.api.nvim_list_tabpages() > 1 then
    vim.cmd("tabclose")
  else
    if #vim.fn.getbufinfo({ buflisted = 1 }) == 0 then
      vim.cmd("Alpha")
    else
      vim.cmd("bdelete")
    end
  end
end, { desc = "Smart close (VSCode-like)" })
