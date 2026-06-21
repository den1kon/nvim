local M = {}

function M.setup()
	vim.keymap.set("n", "<leader>fe", ":Oil --float .<CR>") -- Prefer this of toggle variant because of <C-c> keybind
-- 	vim.keymap.set("n", "<leader>fe", function()
--    if vim.bo.filetype == 'oil' then
--      require("oil").close()
--    else
--      require("oil").open()
--    end
-- end, { desc = "File navigation" })
end

return M
