local M = {}

function M.setup()
	vim.keymap.set("n", "<leader>fe", ":Oil --float .<CR>")
end

return M
