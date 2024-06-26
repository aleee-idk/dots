return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		keys = {
			{
				"<leader>fo",
				"<CMD>ObsidianSearch<CR>",
				desc = "Find note in vault",
			},
		},
		opts = {
			notes_subdir = "notes",
			open_app_foreground = false,
			workspaces = {
				{
					name = "personal",
					path = "~/Repos/Private/docs",
				},
				{
					name = "blog",
					path = "~/Repos/Projects/blog-content",
				},
			},
			finder_mappings = {
				new = "<C-a>",
			},
			completion = {
				-- Where to put new notes created from completion. Valid options are
				--  * "current_dir" - put new notes in same directory as the current buffer.
				--  * "notes_subdir" - put new notes in the default notes subdirectory.
				new_notes_location = "current_dir",
				-- Control how wiki links are completed with these (mutually exclusive) options:
				--
				-- 1. Whether to add the note ID during completion.
				-- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
				-- Mutually exclusive with 'prepend_note_path' and 'use_path_only'.
				prepend_note_id = false,
				-- 2. Whether to add the note path during completion.
				-- E.g. "[[Foo" completes to "[[notes/foo|Foo]]" assuming "notes/foo.md" is the path of the note.
				-- Mutually exclusive with 'prepend_note_id' and 'use_path_only'.
				prepend_note_path = true,
				-- 3. Whether to only use paths during completion.
				-- E.g. "[[Foo" completes to "[[notes/foo]]" assuming "notes/foo.md" is the path of the note.
				-- Mutually exclusive with 'prepend_note_id' and 'prepend_note_path'.
				use_path_only = false,
			},
		},
	},
}
