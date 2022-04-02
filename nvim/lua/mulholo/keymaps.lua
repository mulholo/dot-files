-- equivalent of nnoremap / inoremap etc from vimscript
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>s", ":vsplit<CR>", { silent = true })
map("n", "<leader>i", ":split<CR>", { silent = true })

-- align window jumping with tmux
map("n", "<leader>h", "<c-w>h")
map("n", "<leader>j", "<c-w>j")
map("n", "<leader>k", "<c-w>k")
map("n", "<leader>l", "<c-w>l")

-- Make file directory mapping easier
map("i", "<c-f>", "<c-x><c-f>")

-- Keep blocks selected when indenting
map("v", "< ", "<gv")
map("v", "> ", ">gv")

-- Navigate between display lines like real lines
map("n", "<Up>", "gk", { silent = true })
map("n", "<Down>", "gj", { silent = true })

map("n", "<Down>", "gj", { silent = true })
map("n", "k", "gk", { silent = true })
map("n", "j", "gj", { silent = true })
map("n", "<Home>", "g<Home>", { silent = true })
map("n", "<End>", "g<End>", { silent = true })
map("i", "<Home>", "<C-o>g<Home>", { silent = true })
map("i", "<End>", "<C-o>g<End>", { silent = true })

-- Clear / search with ESC
map("n", "<esc>", ":noh<return><esc>")
