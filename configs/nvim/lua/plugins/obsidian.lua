return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "knowhow",
        path = "/Users/ithaqua/Library/Mobile Documents/com~apple~CloudDocs/knowhow",
      },
    },

    -- see below for full list of options 👇
    notes_dir = ".",
    daily_notes = {
      folder = "./Journal/daily/",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      template = "3. RESOURCE/template/Daily Journal.md",
    },
    templates = {
      folder = "3. RESOURCE/template/",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M:%S",
    },
  },
}
