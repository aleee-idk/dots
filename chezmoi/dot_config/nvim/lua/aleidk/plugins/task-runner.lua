local function term_get_effective_line_count(bufnr)
	local linecount = vim.api.nvim_buf_line_count(bufnr)

	local non_blank_lines = linecount
	for i = linecount, 1, -1 do
		local line = vim.api.nvim_buf_get_lines(bufnr, i - 1, i, true)[1]
		non_blank_lines = i
		if line ~= "" then
			break
		end
	end
	return non_blank_lines
end

-- This is a copy of the original util function of overseer with the change that
-- vim.api.nvim_win_set_cursor(winid, { lnum, 0 }) column is set to 0 so the output is visible
-- the rest is the same
local scroll_to_end = function(winid)
	winid = winid or 0
	local bufnr = vim.api.nvim_win_get_buf(winid)
	local lnum = vim.api.nvim_buf_line_count(bufnr)
	local last_line = vim.api.nvim_buf_get_lines(bufnr, -2, -1, true)[1]
	-- Hack: terminal buffers add a bunch of empty lines at the end. We need to ignore them so that
	-- we don't end up scrolling off the end of the useful output.
	local not_much_output = lnum < vim.o.lines + 6
	if vim.bo[bufnr].buftype == "terminal" and not_much_output then
		lnum = term_get_effective_line_count(bufnr)
		last_line = vim.api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, true)[1]
	end
	local scrolloff = vim.api.nvim_get_option_value("scrolloff", { scope = "local", win = winid })
	vim.api.nvim_set_option_value("scrolloff", 0, { scope = "local", win = winid })
	vim.api.nvim_win_set_cursor(winid, { lnum, 0 })
	vim.api.nvim_set_option_value("scrolloff", scrolloff, { scope = "local", win = winid })
end

local open_split = function(task, horizontal)
	local original_window = vim.api.nvim_get_current_win()
	if horizontal then
		-- horizontal split across all vertical splits
		vim.cmd([[botright split]])
	else
		-- vertical split across all horizontal splits
		vim.cmd([[vert botright split]])
	end

	-- Update tasks buffer options
	vim.api.nvim_win_set_buf(0, task:get_bufnr())
	vim.api.nvim_set_option_value("number", false, { scope = "local", win = 0 })
	vim.api.nvim_set_option_value("relativenumber", false, { scope = "local", win = 0 })
	vim.api.nvim_set_option_value("signcolumn", "no", { scope = "local", win = 0 })
	scroll_to_end(0)

	-- Go back to the original window
	vim.api.nvim_set_current_win(original_window)
end

return {
	"stevearc/overseer.nvim",
	keys = {
		{ "<leader>pO", "<CMD>OverseerQuickAction hsplit<CR>", desc = "Open task in a hsplit" },
		{
			"<leader>pQ",
			"<CMD>OverseerQuickAction close win<CR><CMD>OverseerQuickAction dispose<CR>",
			desc = "Close and dispose task's windows",
		},
		{ "<leader>pW", "<CMD>OverseerQuickAction unwatch<CR>", desc = "Unwatch task" },
		{ "<leader>pf", "<CMD>OverseerQuickAction open float<CR>", desc = "Open task in a float window" },
		{ "<leader>pl", "<CMD>OverseerLoadBundle<CR>", desc = "Load tasks" },
		{ "<leader>pm", "<CMD>OverseerTaskAction<CR>", desc = "Manage task" },
		{ "<leader>po", "<CMD>OverseerQuickAction vsplit<CR>", desc = "Open task in a vsplit" },
		{ "<leader>pp", "<CMD>OverseerRun<CR>", desc = "Run task" },
		{ "<leader>pq", "<CMD>OverseerQuickAction close win<CR>", desc = "Close task's windows" },
		{ "<leader>ps", "<CMD>OverseerSaveBundle<CR>", desc = "Save tasks" },
		{ "<leader>pt", "<CMD>OverseerToggle<CR>", desc = "Toggle tasks list" },
		{ "<leader>pw", "<CMD>OverseerQuickAction watch<CR>", desc = "Watch task" },
	},
	opts = {
		actions = {
			["hsplit"] = {
				desc = "open terminal in a horizontal split",
				condition = function(task)
					local bufnr = task:get_bufnr()
					return bufnr and vim.api.nvim_buf_is_valid(bufnr)
				end,
				run = function(task)
					open_split(task, true)
				end,
			},
			["vsplit"] = {
				desc = "open terminal in a vertical split",
				condition = function(task)
					local bufnr = task:get_bufnr()
					return bufnr and vim.api.nvim_buf_is_valid(bufnr)
				end,
				run = function(task)
					open_split(task, false)
				end,
			},
			["close win"] = {
				desc = "open terminal in a vertical split",
				condition = function(task)
					local bufnr = task:get_bufnr()
					return bufnr and vim.api.nvim_buf_is_valid(bufnr)
				end,
				run = function(task)
					local buf = task:get_bufnr()
					-- iterar sobre todas las windows y ver si la window tiene attach el buf que quiero cerrar
					for _, win in ipairs(vim.api.nvim_list_wins()) do
						if buf == vim.api.nvim_win_get_buf(win) then
							vim.api.nvim_win_close(win, false)
						end
					end
				end,
			},
		},
		task_list = {
			direction = "bottom",
			bindings = {
				["?"] = "ShowHelp",
				["g?"] = "ShowHelp",
				["<CR>"] = "RunAction",
				["<C-e>"] = "Edit",
				["o"] = "Open",
				["<C-v>"] = "OpenVsplit",
				["<C-s>"] = "OpenSplit",
				["<C-f>"] = "OpenFloat",
				["<C-q>"] = "OpenQuickFix",
				["<TAB>"] = "TogglePreview",
				["p"] = "TogglePreview",
				["<C-l>"] = "IncreaseAllDetail",
				["<C-h>"] = "DecreaseAllDetail",
				["L"] = "IncreaseDetail",
				["H"] = "DecreaseDetail",
				["["] = "DecreaseWidth",
				["]"] = "IncreaseWidth",
				["{"] = "PrevTask",
				["}"] = "NextTask",
				["<C-u>"] = "ScrollOutputUp",
				["<C-d>"] = "ScrollOutputDown",
				["q"] = "Close",
				["d"] = "<CMD>OverseerQuickAction dispose<CR>",
			},
		},
	},
}
