-- ctrl+h/j/k/l: move between Neovim splits, then out to the multiplexer pane.
-- Inside Rex ($REX_BLOCK set) the edge hands focus to Rex with `rex focus`
-- (pairs with the `navigate` action in ~/.config/rex/actions.lua); elsewhere
-- vim-tmux-navigator handles tmux as before. Rex no longer exports
-- $REX_SESSION to panes; a block ID works anywhere `-s` takes a session.

local tmux_cmds = { h = "TmuxNavigateLeft", j = "TmuxNavigateDown", k = "TmuxNavigateUp", l = "TmuxNavigateRight" }
local rex_dirs = { h = "left", j = "down", k = "up", l = "right" }

local function navigate(key)
  return function()
    local rex_target = vim.env.REX_BLOCK or vim.env.REX_SESSION
    if not rex_target then
      vim.cmd(tmux_cmds[key])
      return
    end
    local win = vim.api.nvim_get_current_win()
    vim.cmd("wincmd " .. key)
    if vim.api.nvim_get_current_win() == win then
      vim.system({ "rex", "focus", rex_dirs[key], "-s", rex_target })
    end
  end
end

return {
  "christoomey/vim-tmux-navigator",
  init = function()
    -- Otherwise the plugin's own maps replace the ones below once it loads.
    vim.g.tmux_navigator_no_mappings = 1
  end,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-h>", navigate("h"), desc = "Navigate left" },
    { "<c-j>", navigate("j"), desc = "Navigate down" },
    { "<c-k>", navigate("k"), desc = "Navigate up" },
    { "<c-l>", navigate("l"), desc = "Navigate right" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
}
