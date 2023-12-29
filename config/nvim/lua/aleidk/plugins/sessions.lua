return {
	-- sessions
	"rmagatti/auto-session",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
			bypass_session_save_file_types = {
				"NeogitStatus",
			},
		})
	end,
}