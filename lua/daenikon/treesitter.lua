local M = {}

function M.setup()
	require("nvim-treesitter").setup({
		-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
		install_dir = vim.fn.stdpath("data") .. "/site",
	})

	local languages = {
		"rust",
		"markdown",
		"markdown_inline",
		"lua",
		"php",
		"phpdoc",
		"nix",
		"toml",
		"typescript",
		"tsx",
		"json",
		"css",
		"html",
		"typst",
	}

	local filetypes = {
		"rust",
		"markdown",
		"markdown_inline",
		"lua",
		"php",
		"phpdoc",
		"nix",
		"toml",
		"typescript",
		"tsx",
		"typescriptreact",
		"javascriptreact",
		"json",
		"css",
		"html",
		"typst",
	}

	require("nvim-treesitter").install(languages)

	-- Disable native regex syntax highlighting
	vim.cmd([[syntax off]])

	vim.api.nvim_create_autocmd("FileType", {
		pattern = filetypes,
		callback = function()
			-- syntax highlighting, provided by Neovim
			vim.treesitter.language.register("typescript", { "tsx", "javascript", "jsx", "typescriptreact" })
			vim.treesitter.start()
			-- folds, provided by Neovim
			-- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			-- vim.wo.foldmethod = "expr"
			-- indentation, provided by nvim-treesitter
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end,
	})
end

return M
