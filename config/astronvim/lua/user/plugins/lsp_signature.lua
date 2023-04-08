return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  config = function()
    local signature_config = {
      hint_enable = false,
    }

    require("lsp_signature").setup(signature_config)

    vim.keymap.set({ "n" }, "<Leader>k", function()
      vim.lsp.buf.signature_help()
    end, { silent = true, noremap = true, desc = "toggle signature" })
  end,
}
