vim.g.mapleader = " "

-- Lazy
require("config.lazy")

vim.cmd([[colorscheme tokyonight-night]])

-- me
require("daenikon").init()
-- My note-taking plugin
-- require("digital-notes.usercommands").setup()
-- require("digital-notes.keybinds").setup()

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Must-haves
--
vim.o.conceallevel = 2
-- Line numbers
vim.o.relativenumber = true
vim.o.number = true

vim.o.wrap = false
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])

vim.api.nvim_set_hl(0, "CustomHipatternsDefinition", { bg = "#3f62a8" })
vim.api.nvim_set_hl(0, "CustomHipatternsYamlFrontmatter", { bg = "#2f302e" })
vim.api.nvim_set_hl(0, "SpellBad", { italic = true, undercurl = true })
-- vim.api.nvim_set_hl(0, "SpellCad", { italic = true, fg = "#aaaa27", undercurl = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	callback = function()
		-- markdown_callback()
		-- vim.cmd([[ToggleEnglishSpellcheck]]) -- Enables English spell checking, since it is off by default
	end,
})

--- --------------------------------------------
local MARKDOWN_LINK_PATTERN = "%[[^%]]+%]%(([^%)%]]*)%)"
local WIKILINK_PATTERN = "%[%[(.-)%]%]"

local function is_table_empty(table)
	-- if next(table) == nil then
	-- 	return true
	-- end
	-- return false

	-- I don't find this intuitive, so I'll extract it to a function
	-- substitute for ternary expression
	return next(table) == nil and true or false
end

-- find all matches in a string and return as a table
local function find_matches(str, pattern)
	local matches = {}
	-- Start search from the beginning of the string (1-indexed)
	local start = 1
	while start <= string.len(str) do
		local startPos, endPos, capture = string.find(str, pattern, start)
		-- Break the loop if no more matches are found
		if not startPos then
			break
		end
		table.insert(matches, {
			startPos = startPos,
			endPos = endPos,
			capture = capture,
		})
		-- Update the start position for the next search
		start = endPos + 1
	end

	if is_table_empty(matches) then
		return nil
	end

	return matches
end

local function get_buffer_position()
	local current_line = vim.api.nvim_get_current_line()
	local current_cursor_column = vim.api.nvim_win_get_cursor(0)[2]

	return {
		cursorLine = current_line,
		cursorPosition = current_cursor_column,
	}
end

local function get_match_at_cursor(pattern)
	local buffer_pos = get_buffer_position()
	local matches = find_matches(buffer_pos.cursorLine, pattern)
	if matches == nil then
		return nil
	end

	for _, match in ipairs(matches) do
		local cursor_pos = buffer_pos.cursorPosition + 1 -- now 1-indexed
		if cursor_pos >= match.startPos and cursor_pos <= match.endPos then
			return match.capture
		end
	end

	-- vim.print(buffer_pos)
	-- vim.print(matches)
	return nil
end

vim.keymap.set("n", "<leader>t", function()
	vim.print(get_match_at_cursor(MARKDOWN_LINK_PATTERN))
end)

-- vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float)

-- [[123]]
-- [123](456)
