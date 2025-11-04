local nvim_lsp = require("lspconfig")

-- Override handlers for all LSP servers
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      -- Make diagnostics update as you type
      client.handlers["textDocument/didChange"] = function(err, method, params, client_id)
        vim.lsp.buf_notify(0, "textDocument/didChange", params)
      end
    end
  end,
})
