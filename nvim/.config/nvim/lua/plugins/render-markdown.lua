return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		render_modes = true,
		completions = { lsp = { enabled = true } },
		anti_conceal = {
			ignore = {
				head_background = true,
				head_border = true,
			},
		},
		heading = {
			border = true,
			position = "inline",
			above = "",
		},
		code = {
			border = "thin",
		},
		sign = {
			enabled = false,
		},
	},
}
