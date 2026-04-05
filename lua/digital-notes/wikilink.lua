local M = {}

---cached patterns
---@type string
-- local wikilink_body_pattern = "%[%[(.-)%]%]"

--
-- local test_input = "abcd [[File Name.md|Optional Title]]"
-- print(test_input:match(wikilink_file_name_pattern))
--
-- ---@return string or nil
-- function get_wikilink_body(input)
-- 	return input:match("%[%[(.-)%]%]")
-- end
--
-- ---Extension for file name is optional
-- ---@return string or nil
-- function get_wikilink_file_name_from_body(wikilink_body)
-- 	if not wikilink_body then return nil end
-- 	return wikilink_body:match("([^|]+)")
-- end
--
-- ---Title is optional
-- ---@return string or nil
-- function get_wikilink_title_from_body(wikilink_body)
-- 	if not wikilink_body then return nil end
-- 	return wikilink_body:match("|(.+)")
-- end
--
-- function M.get_wikilink_file_name(input)
-- 	local body = get_wikilink_body(input)
-- end
--
-- -- local function test(input)
-- -- 	local body = M.get_wikilink_body(input)
-- -- 	print("Body: " .. body)
-- -- 	local filename = M.get_wikilink_file_name_from_body(body)
-- -- 	print("Filename: " .. filename)
-- -- 	local title = M.get_wikilink_title_from_body(body)
-- -- 	print("Title: " .. title)
-- -- end
-- --
-- -- local input1 = "abcd [[Important|Title]] bcd"
-- -- local input2 = "abcd [[Filename.md|Title]] bcd"
-- -- test(input1)
-- -- test(input2)

--- Parses the first wikilink occurrence in a string
--- @param input string The input string to parse
--- @return table|nil { wikilink_start: number, wikilink_end: number, filename: string } or nil if no wikilink found
local function parse_first_wikilink(input)
	-- Pattern:  [[filename|title]] or [[filename]]
	-- Captures:   start position, filename (everything before | or ]])
	local start_pos, end_pos, filename = input:find("%[%[([^|%]]+)[^%]]*%]%]")

	if not start_pos then
		return nil
	end

	return {
		wikilinkStart = start_pos,
		wikilinkEnd = end_pos,
		filename = filename,
	}
end

return M
