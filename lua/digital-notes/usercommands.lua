local M = {}

---Setup usercommands
---@return nil
function M.setup()
	local notes = require("digital-notes")

	vim.api.nvim_create_user_command("InsertFrontmatter", function()
		notes.insert_frontmatter_at_top()
	end, { desc = "Insert YAML frontmatter at top of buffer" })

	vim.api.nvim_create_user_command("OpenDailyNote", function()
		notes.open_daily_note()
	end, { desc = "Open daily note" })
end

return M
