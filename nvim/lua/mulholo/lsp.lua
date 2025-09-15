-- Vanilla Neovim LSP setup

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TypeScript-Go LSP configuration
local tsgo_path = vim.fn.expand("~/dev/typescript-go/built/local/tsgo")

if vim.fn.executable(tsgo_path) == 1 then
  vim.lsp.config['tsgo'] = {
    cmd = { tsgo_path, "--lsp", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript", 
      "typescriptreact",
      "typescript.tsx"
    },
    root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
    setup = {
      capabilities = capabilities
    }
  }

  vim.lsp.enable('tsgo')
else
  vim.notify("TypeScript-Go LSP not found at " .. tsgo_path .. ". Run ./install-typescript-go to install.", vim.log.levels.WARN)
end

-- LSP keymaps and behavior on attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    local opts = { noremap = true, silent = true }

    -- LSP keybindings
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "single" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>p", '<cmd>lua vim.diagnostic.goto_next({ border = "single" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>P", '<cmd>lua vim.diagnostic.goto_prev({ border = "single" })<CR>', opts)

    -- Format command
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format()' ]]

    -- Enable completion if client supports it
    -- if client:supports_method('textDocument/completion') then
    --   vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = false })
    -- end
  end,
})
