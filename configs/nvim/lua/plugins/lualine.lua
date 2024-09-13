return {
  -- load lualine.nvim plugin
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = {
        -- theme = "palenight", -- set your desired theme here, e.g., 'gruvbox', 'tokyonight', etc.
        section_separators = { "", "" },
        component_separators = { "", "" },
      }

      -- Customize the sections of the status line
      -- opts.sections = {
      --   lualine_a = { "mode" },
      --   lualine_b = { "branch", "diff", "diagnostics" },
      --   lualine_c = { "filename" },
      --   lualine_x = { "encoding", "fileformat", "filetype" },
      --   lualine_y = { "progress" },
      --   lualine_z = { "location" },
      -- }
    end,
  },
}
