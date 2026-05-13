-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Copy relative path to clipboard
vim.keymap.set("n", "<leader>fp", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  vim.notify("Copied relative path: " .. path)
end, { desc = "Copy relative file path" })

-- Copy absolute path to clipboard
vim.keymap.set("n", "<leader>fP", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Copied absolute path: " .. path)
end, { desc = "Copy absolute file path" })

-- Copy file path as Claude Code @mention
vim.keymap.set("n", "<leader>fm", function()
  local path = vim.fn.expand("%")
  local mention = "@" .. path
  vim.fn.setreg("+", mention)
  vim.notify("Copied mention: " .. mention)
end, { desc = "Copy file mention for Claude Code" })

-- Copy visual selection line range as Claude Code mention (@path:start-end)
vim.keymap.set("v", "<leader>fm", function()
  local path = vim.fn.expand("%")
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")
  local mention = "@" .. path .. "#L" .. start_line .. "-" .. end_line
  vim.fn.setreg("+", mention)
  vim.notify("Copied code mention: " .. mention)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
end, { desc = "Copy visual code mention for Claude Code" })
