return {
	dir = "/home/dk/gitLair/marknav.nvim",
	-- lazy = false
	ft = { "markdown", "md" },
	config = function()
		require("marknav").setup()
	end,
}
