require("harpoon").setup({
  global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = true,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = true,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,
  },
  projects = {
    -- Yes $HOME works
    ["$HOME/personal/vim-with-me/server"] = {
      term = {
        cmds = {
          "./env && npx ts-node src/index.ts",
        },
      },
    },
  },
})
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local tmux = require("harpoon.tmux")
local telescope = require("telescope")

local command_prompt = "Enter command: "

telescope.load_extension("harpoon")

local function map(key, func, desc)
  vim.keymap.set("n", "<leader><leader>" .. key, func, { desc = desc })
end

map("n", mark.add_file, "Add mark")

map("t", ui.toggle_quick_menu, "Toogle UI")

map("j", function()
  ui.nav_file(1)
end, "Navigate to file 1")

map("k", function()
  ui.nav_file(2)
end, "Navigate to file 2")

map("l", function()
  ui.nav_file(3)
end, "Navigate to file 3")

map("ñ", function()
  ui.nav_file(4)
end, "Navigate to file 4")

map("g", function()
  local input = vim.fn.input(command_prompt)
  tmux.sendCommand("{next}", input)
end, "Send command to tmux pane 1")

map("G", function()
  tmux.sendCommand("{next}", "\3")
end, "Send command to tmux pane 1")

map("T", "<CMD>Telescope harpoon marks<CR>", "Open marks in telescope")
