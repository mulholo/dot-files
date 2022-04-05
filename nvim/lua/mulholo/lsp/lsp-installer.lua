local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("mulholo.lsp.handlers").on_attach,
    capabilities = require("mulholo.lsp.handlers").capabilities,
  }

  if server.name == "jsonls" then
    local jsonls_opts = require("mulholo.lsp.settings.jsonls")
    -- add specific JSON settings
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("mulholo.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require("mulholo.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server.name == "tsserver" then
    local tsserver_opts = {
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx" 
      }
    }
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  server:setup(opts)
end)
