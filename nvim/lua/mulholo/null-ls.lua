local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local code_actions = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    code_actions.eslint,
    -- diagnostics.cspell,
    null_ls.builtins.code_actions.eslint,
    formatting.prettier.with,
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    diagnostics.flake8,
  },
  -- Format on save
  on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
          vim.cmd([[
          augroup LspFormatting
              autocmd! * <buffer>
              autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END
          ]])
      end
  end,
}
