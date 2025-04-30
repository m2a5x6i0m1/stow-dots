return {
	"obsidian-nvim/obsidian.nvim",
	event = "VeryLazy",
	config = function()
		require("obsidian").setup({
			-- note_id_func = require("obsidian.builtin").zettel_id,
			--
			-- note_path_func = function(spec)
			-- 	-- This is equivalent to the default behavior.
			-- 	local path = spec.dir / tostring(spec.id)
			-- 	return path:with_suffix(".md", true)
			-- end,

			frontmatter = {
				enabled = false,
				func = function(note)
					local out = {
						type = nil, -- TODO: Find out how to create a popup that will prompt to assign type on note creation
						id = note.id,
						date_written = os.date("%Y-%m-%d"),
						date_modified = nil, -- TODO: Find out how to make it change on each file write, instead of it being saved by `if note.metadata ...`
						tags = note.tags,
					}
					if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
						for k, v in pairs(note.metadata) do
							out[k] = v
						end
					end
					return out
				end,
				sort = { "type", "id", "date_written", "date_modified", "tags" },
			},

			daily_notes = {
				enabled = true,
				folder = "daily-notes",
				default_tags = {},
			},

			templates = {
				enabled = true,
				folder = "templates",
			},

			backlinks = {
				parse_headers = false,
			},

			checkbox = {
				create_new = false,
				order = { " ", "x" },
			},

			workspaces = {
				{
					name = "personal",
					path = "~/notes",
				},
			},

			completion = { min_chars = 0 },
			picker = { name = "snacks.picker" },
			footer = { enabled = false },
			ui = { enable = false },
			slides = { enabled = false },
			unigue_note = { enabled = false },
			legacy_commands = false,
		})

		-- Remove keymap that conflicts with mini.bracketed
		vim.api.nvim_create_autocmd("User", {
			pattern = "ObsidianNoteEnter",
			callback = function(ev)
				vim.keymap.del("n", "[o", { buffer = ev.buf })
				vim.keymap.del("n", "]o", { buffer = ev.buf })
			end,
		})

		-- Folding based on obsidian.nvim obsidian-ls implementation
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				if not (client and client.name == "obsidian-ls") then
					return
				end

				for _, win in ipairs(vim.fn.win_findbuf(ev.buf)) do
					vim.wo[win][0].foldlevel = 99
					vim.wo[win][0].foldmethod = "expr"
					vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
					vim.wo[win][0].foldtext = "v:lua.vim.lsp.foldtext()"
				end
			end,
		})

    -- stylua: ignore
		vim.keymap.set("n", "<leader>nf", function()Snacks.picker.files({ cwd = "~/notes" })end, { desc = "Find" })
    -- stylua: ignore
		vim.keymap.set("n", "<leader>ng", function()Snacks.picker.grep({ cwd = "~/notes" })end, { desc = "Grep" })

		vim.keymap.set("n", "<leader>nn", "<cmd>Obsidian new<cr>", { desc = "New" })
		vim.keymap.set("n", "<leader>nr", "<cmd>Obsidian rename<cr>", { desc = "Rename" })
		vim.keymap.set("n", "<leader>nd", "<cmd>Obsidian today<cr>", { desc = "Daily" })

		-- vim.keymap.set("n", "<leader>nN", "<cmd>Obsidian new_from_template<cr>", { desc = "New from template" })

		-- vim.keymap.set("n", "<leader>nb", "<cmd>Obsidian backlinks<cr>", { desc = "Backlinks" })
		-- vim.keymap.set("n", "<leader>nl", "<cmd>Obsidian links<cr>", { desc = "Outgoing links" })
		-- vim.keymap.set("n", "<leader>nt", "<cmd>Obsidian tags<cr>", { desc = "Tags" })
	end,
}
