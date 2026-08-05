local HOME = os.getenv("HOME")

return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      ["php"] = {}, -- disable phpcs completely
    },
    linters = {
      markdownlint = {
        args = { "--disable", "MD013", "--" },
      },
      ["markdownlint-cli2"] = {
        args = { "--config", HOME .. "/.markdownlint-cli2.yaml", "--" },
      },
    },
  },
}

-- The $HOME/.markdownlint-cli2.yaml looks like this:
--
-- config:
--   MD013: false
