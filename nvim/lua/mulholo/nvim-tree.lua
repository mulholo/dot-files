local status_ok, vim_tree = pcall(require, "vim-tree")
if not status_ok then
	return
end

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = false,
	update_cwd = true,
	diagnostics = {
		enable = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 60,
		side = "right",
		number = false,
		relativenumber = false,
	},
	renderer = {
		highlight_git = true,
	},
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")
		
		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end
		
		-- Default mappings
		api.config.mappings.default_on_attach(bufnr)
		
		-- Custom mappings
		vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
		vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
		vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open: Horizontal Split'))
	end,
})
