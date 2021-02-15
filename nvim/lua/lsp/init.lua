local nvim_lsp = require('lspconfig')
local completion = require('completion')
local lsp_status = require('lsp-status')

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)
  completion.on_attach(client, bufnr)

  -- Keybindings for LSPs
  -- Note these are in on_attach so that they don't override bindings in a non-LSP setting
  vim.fn.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  -- show type | mnemonic: go interface
  vim.fn.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
  -- show error list | mnemonic: list
  vim.fn.nvim_set_keymap("n", "gl", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", {noremap = true, silent = true})
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = true,
  }
)

nvim_lsp.tsserver.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}

nvim_lsp.tsserver.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}

nvim_lsp.bashls.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}

nvim_lsp.html.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}

nvim_lsp.pyls.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}

nvim_lsp.yamlls.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}

nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}
