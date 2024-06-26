local M = {}

function M.on_attach(_, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, opts)
  vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run, opts)
  vim.keymap.set("n", "<leader>cr", vim.lsp.codelens.refresh, opts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
end

return M
