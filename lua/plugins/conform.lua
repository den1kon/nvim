return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>fl",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			-- python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
			yaml = { "prettierd" },
			nix = { "nixfmt" },
			json = { "jq" },
			php = { "php-cs-fixer" },
			typst = { "typstyle" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 700,
			lsp_format = "fallback",
		},
		formatters = {
			["php-cs-fixer"] = {
				command = "php-cs-fixer",
				args = {
					"fix",
					"--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
					"$FILENAME",
				},
				stdin = false,
			},
			-- ["typstyle"] = {
			-- 	command = "typstyle",
			-- 	args = {
			-- 		"-i",
			-- 		"$FILENAME",
			-- 	},
			-- },
		},
		notify_on_error = true,
	},
}
