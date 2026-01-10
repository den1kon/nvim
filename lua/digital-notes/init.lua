local M = {}

---@type string
local iso8601_template = '!%Y-%m-%dT%H:%M:%SZ'

---Generates an ISO8601 date and time timestamp in UTC
---@return string
local function generate_iso8601_utc_timestamp()
  return os.date(iso8601_template)
end

local function get_header()
	return vim.fn.expand('%:t:r')
end

---Prints the current ISO8601 timestamp
---@return nil
-- function M.print_current_timestamp()
--   print(generate_iso8601_utc_timestamp())
-- end

---Generates YAML frontmatter
---@return table
function M.generate_yaml_frontmatter()
  local id = generate_iso8601_utc_timestamp()
	local header = get_header()

  local frontmatter = {
    '---',
    'id: "' .. id .. '"',
    'tags: ',
    '  - fleeting',
		'  - permanent',
		'  - source',
    '---',
		'',
		'# ' .. header,
    ''
  }
  
  return frontmatter
end

---Inserts YAML frontmatter at the beginning of the current buffer
---@return nil
function M.insert_frontmatter_at_top()
  local frontmatter = M.generate_yaml_frontmatter()
  
  -- Insert at line 0 (beginning of buffer)
  vim.api.nvim_buf_set_lines(0, 0, 0, false, frontmatter)
  
  -- Move cursor after frontmatter
  vim.api.nvim_win_set_cursor(0, {#frontmatter + 1, 0})
end

return M
