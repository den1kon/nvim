local M = {}

function M.setup()
	-- Primary register yanking/deleting
	vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y<CR>')
	vim.keymap.set({ "n", "v", "x" }, "<leader>d", '"+d<CR>')

	-- QoL
	vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
	vim.keymap.set("n", "<leader>w", ":write<CR>")
	vim.keymap.set("n", "<leader>q", ":quit<CR>")

	-- Telescope
	require("daenikon.keybinds.telescope").setup()
	-- Oil
	require("daenikon.keybinds.oil").setup()
end

return M
