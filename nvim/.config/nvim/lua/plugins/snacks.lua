return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		image = { enabled = false, formats = {} },

		quickfile = { enabled = true },
		bigfile = { enabled = true },
		terminal = { enabled = true },
		input = { enabled = true },

		scope = {
			enabled = true,
			cursor = false,
		},

		indent = {
			enabled = true,
			indent = { char = "┊" },
			scope = { char = "┊" },
		},

		notifier = {
			enabled = true,
			timeout = 2500,
			margin = { top = 0, right = 0, bottom = 1 },
			style = "compact",
		},

		picker = {
			prompt = "  ",
			layout = {
				cycle = true,
				preset = "ivy_split",
			},
			formatters = {
				file = { icon_width = 3 },
			},
		},

		styles = {
			notification = {
				wo = {
					wrap = true,
					linebreak = true,
				},
			},
		},
	},

	keys = {

		-- Top Pickers
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "List Buffers",
		},
		{
			"<leader>.",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},

		-- find
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Files",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.files({ cwd = "~/stow-dots", hidden = true })
			end,
			desc = "Dotfiles",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Config Files",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>fh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Search",
		},

		-- git
		{
			"<leader>go",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Open Origin",
			mode = { "n", "v" },
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Blame Line",
		},

		-- Others
		{
			"<leader>rf",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
		{
			"<C-/>",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "Toggle Terminal",
			mode = { "n", "t" },
		},
	},
	init = function()
		-- Recommended settings
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Setup some globals for debugging (lazy-loaded)
				_G.dd = function(...)
					Snacks.debug.inspect(...)
				end
				_G.bt = function()
					Snacks.debug.backtrace()
				end
				vim.print = _G.dd -- Override print to use snacks for `:=` command

				Snacks.toggle.diagnostics():map("<leader>dt")
				Snacks.toggle.inlay_hints():map("<leader>dh")
			end,
		})

		-- Oil integration
		vim.api.nvim_create_autocmd("User", {
			pattern = "OilActionsPost",
			callback = function(event)
				if event.data.actions.type == "move" then
					Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
				end
			end,
		})
	end,
}
