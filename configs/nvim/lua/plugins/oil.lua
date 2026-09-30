return {
  {
    "stevearc/oil.nvim",
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    config = function()
      require("oil").setup({
        columns = { "icon", "permissions", "size", "mtime" },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["<C-k>"] = false,
          ["<C-j>"] = false,
          ["<M-h>"] = "actions.select_split",
          ["<C-r>"] = "actions.refresh",
        },
        view_options = { show_hidden = true },
        -- Set to true to watch the filesystem for changes and reload oil
        watch_for_changes = false,
      })

      -- Open parent directory in current window
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },
}
