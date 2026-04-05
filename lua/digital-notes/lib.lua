local M = {}

function M.find_all_occurrences(str, pattern)
	local occurrences = {}
	-- Start search from the beginning of the string (1-indexed)
	local start = 1
	while start <= string.len(str) do
		local startPos, endPos, linkStr = string.find(str, pattern, start)
		-- Break the loop if no more matches are found
		if not startPos then
			break
		end
		table.insert(occurrences, {
			startPos = startPos,
			endPos = endPos,
			linkStr = linkStr,
		})
		-- Update the start position for the next search
		start = endPos + 1
	end
	return occurrences
end

return M
