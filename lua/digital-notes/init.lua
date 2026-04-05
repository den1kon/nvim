local M = {}

---Date and time UTC ISO8601 template
---@type string
local iso8601_template = "!%Y-%m-%dT%H:%M:%SZ"

---Generates an ISO8601 date and time timestamp in UTC
---@return string
local function generate_iso8601_utc_timestamp()
	return os.date(iso8601_template)
end

--- Generates a markdown h1 header by using the file name
--- @return string
local function get_buffer_filename_without_extension()
	return vim.fn.expand("%:t:r")
end

---Prints the current ISO8601 timestamp
---@return nil
-- function M.print_current_timestamp()
--   print(generate_iso8601_utc_timestamp())
-- end

---Generates YAML frontmatter
---@return table
function M.generate_yaml_frontmatter(note_type, custom_title)
	local id = generate_iso8601_utc_timestamp()
	local title = custom_title or get_buffer_filename_without_extension()

	local frontmatter = {
		"---",
		'id: "' .. id .. '"',
		"tags: ",
		"  - " .. note_type,
		"---",
		"",
		"# " .. title,
		-- ''
	}

	return frontmatter
end

---Inserts YAML frontmatter at the beginning of the current buffer
---@return nil
function M.insert_frontmatter_at_top()
	local frontmatter = M.generate_yaml_frontmatter("fleeting-note")

	-- Insert at line 0 (beginning of buffer)
	vim.api.nvim_buf_set_lines(0, 0, 0, false, frontmatter)

	-- Move cursor after frontmatter
	-- vim.api.nvim_win_set_cursor(0, {#frontmatter + 1, 0})
end

---Opens or creates a daily note with ISO8601 filename and human-readable title
---@return nil
function M.open_daily_note()
	-- Generate filename: YYYY-MM-DD.md
	local filename = os.date("%Y-%m-%d") .. ".md"

	-- Generate human-readable title: Feb 17 2026 (Tuesday)
	local title = os.date("%b %d %Y (%A)")

	-- Open/create the file
	vim.cmd("edit " .. filename)

	-- Check if buffer is empty (new file)
	local line_count = vim.api.nvim_buf_line_count(0)
	local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]

	if line_count == 1 and (first_line == nil or first_line == "") then
		-- Buffer is empty, insert frontmatter
		local frontmatter = M.generate_yaml_frontmatter("daily-note", title)
		vim.api.nvim_buf_set_lines(0, 0, 0, false, frontmatter)

		-- Move cursor to end of buffer for easy editing
		vim.api.nvim_win_set_cursor(0, { #frontmatter + 1, 0 })
	end
end

return M
