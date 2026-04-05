local M = {}

local function setup_wikilink_conceal()
	-- Conceal opening brackets [[
	vim.cmd("syntax match WikiLinkOpen '\\[\\[' conceal")
	-- Conceal the file name and pipe:   [[File Name|
	vim.cmd([=[syntax match WikiLinkFileName '\[\[[^|]*|' conceal]=])
	-- Conceal closing brackets ]]
	vim.cmd("syntax match WikiLinkClose '\\]\\]' conceal")
	-- Conceal settings
	-- vim.opt_local.conceallevel = 2
	-- vim.opt_local.concealcursor = "nc"
end

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "markdown", "vimwiki" },
-- 	callback = setup_wikilink_conceal,
-- })

function M.setup()
	-- Set colorcolumn for markdown files at 100 characters
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "markdown",
		callback = function()
			setup_wikilink_conceal()
			vim.opt_local.colorcolumn = "100"
			-- vim.opt_local.textwidth = 100 -- Hard wrap at 100 chars
			-- vim.opt_local.wrap = true -- Enable soft wrap
			-- vim.opt_local.linebreak = true -- Wrap at word boundaries
		end,
	})
end

return M
