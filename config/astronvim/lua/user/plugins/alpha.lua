return {
	"goolord/alpha-nvim",
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			"           ████            ███      █████ █████     ",
			"          ░░███           ░░░      ░░███ ░░███      ",
			"  ██████   ░███   ██████  ████   ███████  ░███ █████",
			" ░░░░░███  ░███  ███░░███░░███  ███░░███  ░███░░███ ",
			"  ███████  ░███ ░███████  ░███ ░███ ░███  ░██████░  ",
			" ███░░███  ░███ ░███░░░   ░███ ░███ ░███  ░███░░███ ",
			"░░████████ █████░░██████  █████░░████████ ████ █████",
			" ░░░░░░░░ ░░░░░  ░░░░░░  ░░░░░  ░░░░░░░░ ░░░░ ░░░░░ ",
		}
		dashboard.section.header.opts.hl = "DashboardHeader"

		local button = require("astronvim.utils").alpha_button
		dashboard.section.buttons.val = {
			button("LDR f p", "  Recent Project  "),
			button("LDR f f", "  Find File  "),
			button("LDR o", "פּ  File Explorer  "),
			button("LDR m a", "  Bookmarks  "),
		}

		dashboard.section.footer.val =
		{ " ", " ", " ", "AstroNvim loaded " .. require("lazy").stats().count .. " plugins " }
		dashboard.section.footer.opts.hl = "DashboardFooter"

		dashboard.config.layout[1].val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) })
		dashboard.config.layout[3].val = 5
		dashboard.config.opts.noautocmd = true
		return dashboard
	end,
}
