local M = {}

function M.setup()
	-- Lua
	require("daenikon.lsp.lua_ls").setup()
	-- Nix
	require("daenikon.lsp.nil_ls").setup()
	-- Markdown
	require("daenikon.lsp.markdown_oxide").setup()
	-- PHP
	require("daenikon.lsp.phpactor").setup()
	-- TypeScript / JavaScript
	require("daenikon.lsp.ts_ls").setup()
	-- Typst (tinymist)
	require("daenikon.lsp.tinymist").setup()

	vim.lsp.enable({ "lua_ls", "nil_ls", "markdown_oxide", "phpactor", "ts_ls", "tinymist" })
end

return M
