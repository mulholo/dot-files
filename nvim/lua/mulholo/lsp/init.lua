local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("mulholo.lsp.lsp-installer")
require("mulholo.lsp.handlers").setup()
