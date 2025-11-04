-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- ~/.config/nvim/lua/config/options.lua

-- Load LazyVim default options first
require("lazyvim.config").init()

-- Your custom options
local opt = vim.opt

opt.relativenumber = true -- show relative line numbers
opt.number = true
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- ✅ Transparent background setup
vim.api.nvim_create_autocmd({ "ColorScheme", "User" }, {
  pattern = { "*", "LazyVimStarted" },
  callback = function()
    local groups = {
      "Normal",
      "NormalNC",
      "NormalFloat",
      "FloatBorder",
      "SignColumn",
      "LineNr",
      "FoldColumn",
      "EndOfBuffer",
      "MsgArea",
      "CursorLineNr",
      "Pmenu",
      "PmenuSel",
      "TelescopeNormal",
      "TelescopeBorder",
      "TermNormal",
      "TermNormalNC",
    }

    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
    end

    -- 🌳 Neo-tree transparency
    local neo_groups = { "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeEndOfBuffer" }
    for _, group in ipairs(neo_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
    end

    -- 🛰️ Satellite transparency
    local sat_groups = {
      "SatelliteCursor",
      "SatelliteSearch",
      "SatelliteSearchCurrent",
      "SatelliteDiagnosticError",
      "SatelliteDiagnosticWarn",
      "SatelliteDiagnosticInfo",
      "SatelliteDiagnosticHint",
      "SatelliteGitSignsAdd",
      "SatelliteGitSignsChange",
      "SatelliteGitSignsDelete",
      "SatelliteMark",
      "SatelliteQuickfix",
    }
    for _, group in ipairs(sat_groups) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
  end,
})

-- === Custom Diagnostic Icons ===
local function set_diagnostic_signs()
  for type, icon in pairs({
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
  }) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

-- apply now
set_diagnostic_signs()

-- re-apply after every colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_diagnostic_signs,
})
