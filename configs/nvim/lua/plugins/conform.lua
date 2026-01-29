return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["python"] = { "ruff_format" },
      ["php"] = { "php-cs-fixer" },
      ["astro"] = { "prettier" },
    },
    notify_on_error = true,
    formatters = {
      ["php-cs-fixer"] = {
        command = "php-cs-fixer",
        args = {
          "fix",
          "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
          "$FILENAME",
        },
        stdin = false,
      },
    },
  },
}
