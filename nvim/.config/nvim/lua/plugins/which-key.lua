return {
	"folke/which-key.nvim",
	opts = {
		preset = "helix",
		delay = 500,
		spec = {
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>s", group = "[S]plit" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>l", group = "[L]azy" },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>r", group = "[R]e" },
			{ "<leader>n", group = "[N]ote" },
			{ "<leader>d", group = "[D]iagnostic" },
		},
		icons = {
			separator = ">  ",
			group = "",
			mappings = false,
		},
	},
}
