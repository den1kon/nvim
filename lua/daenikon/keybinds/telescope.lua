local M = {}

function M.setup()
	vim.keymap.set("n", "<leader>lg", ":Telescope live_grep<CR>")
	vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
	vim.keymap.set("n", "<leader>gs", ":Telescope grep_string<CR>")
	vim.keymap.set("n", "<leader>gf", ":Telescope git_files<CR>")
end

return M
