return {
  "dstein64/nvim-scrollview",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("scrollview").setup({
      -- === General ===
      current_only = false, -- Show scrollbar in all windows
      winblend = 50, -- Transparency (0 = opaque, 100 = fully transparent)
      base = "right", -- Position of scrollbar: "right" or "left"
      column = 1, -- Distance from edge
      signs_on_startup = { "all" }, -- Show all indicators by default
      excluded_filetypes = { "neo-tree", "dashboard", "lazy" },

      -- === Handlers ===
      handlers = {
        cursor = true, -- Cursor position indicator
        diagnostics = true, -- Diagnostic marks
        gitsigns = true, -- Git signs integration
        search = true, -- Search matches
        marks = true, -- Show marks
        quickfix = true, -- Show quickfix list positions
      },

      -- === Visuals ===
      signs_column = 0, -- Offset of the signs column relative to scrollbar
      signs_max_per_row = 1, -- Avoid overlapping signs

      -- === Characters ===
      signs = {
        cursor = "┃",

        diagnostic = {
          [vim.diagnostic.severity.ERROR] = "", -- nf-fa-times_circle
          [vim.diagnostic.severity.WARN] = "", -- nf-fa-exclamation_triangle
          [vim.diagnostic.severity.INFO] = "", -- nf-fa-info_circle
          [vim.diagnostic.severity.HINT] = "", -- nf-fa-question_circle
        },

        gitsigns = {
          add = "", -- nf-fa-plus_circle
          change = "", -- nf-oct-diff_modified
          delete = "", -- nf-fa-minus_circle
        },

        search = "", -- nf-oct-search
        marks = "", -- nf-fa-bookmark
        quickfix = "", -- nf-mdi-flash
      },

      -- === Important ===
      -- Include all severities so icons render correctly
      diagnostics_severities = {
        vim.diagnostic.severity.ERROR,
        vim.diagnostic.severity.WARN,
        vim.diagnostic.severity.INFO,
        vim.diagnostic.severity.HINT,
      },
    })
  end,
}
