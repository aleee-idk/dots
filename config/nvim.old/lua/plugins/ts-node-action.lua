require("ts-node-action").setup({})

vim.keymap.set({ "n" }, "<leader>lt", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
