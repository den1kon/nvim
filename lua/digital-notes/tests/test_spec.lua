local lib = require("digital-notes.lib")

describe("find_all_occurrences():", function()
	local input
	local pattern = "%[%[([^|%]]+)[^%]]*%]%]"

	before_each(function()
		input = ""
	end)

	it("Wikilink without placeholder", function()
		input = "[[my_favourite_file.md]]"
		assert.are.same(
			{ { startPos = 1, endPos = 24, linkStr = "my_favourite_file.md" } },
			lib.find_all_occurrences(input, pattern)
		)
	end)

	it("Wikilink with placeholder", function()
		input = "[[my_favourite_file.md|Favourite File]]"
		assert.are.same(
			{ { startPos = 1, endPos = 39, linkStr = "my_favourite_file.md" } },
			lib.find_all_occurrences(input, pattern)
		)
	end)
end)
