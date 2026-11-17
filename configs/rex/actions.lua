-- Custom actions: named Lua functions, shown in the command palette.
-- Docs: https://www.superlogical.com/rex/docs/customize/actions

local util = require("util")

-- tmux: bind o run-shell "open #{pane_current_path}"
rex.action{
  name     = "open_cwd",
  title    = "Open Current Directory in Finder",
  category = "Pane",
  run      = function(ctx, args)
    local cwd = util.block_cwd(ctx.session_id, ctx.block_id)
    if not cwd then return nil end
    rex.exec({ "open", cwd })
  end,
}

-- vim-tmux-navigator: ctrl+h/j/k/l go to Neovim when it is in the
-- foreground, otherwise move focus between Rex panes. Neovim moves focus
-- back out to Rex at its edges (~/.config/nvim/lua/plugins/vim-tmux-navigator.lua).
local NAV_KEYS = { left = "h", down = "j", up = "k", right = "l" }

local function is_vim(session_id, block_id)
  local p = rex.block.call(util.TERMINAL, "process", { session_id = session_id, block_id = block_id })
  local fg = p and p.foreground
  if not fg then return false end
  for _, s in ipairs({ fg.name, fg.argv0, fg.invoked_path }) do
    local base = type(s) == "string" and s:match("([^/]+)$")
    if base and base:match("^n?vim$") then return true end
  end
  return false
end

rex.action{
  name     = "navigate",
  title    = "Navigate Pane (Neovim-aware)",
  category = "Pane",
  args     = { direction = "string" },
  run      = function(ctx, args)
    -- Server calls rather than rex.client.queue, so this works no matter
    -- which client pressed the key.
    if is_vim(ctx.session_id, ctx.block_id) then
      return util.send_ctrl_key(ctx.session_id, ctx.block_id, NAV_KEYS[args.direction])
    end
    return rex.session.focus_direction{ session_id = ctx.session_id, direction = args.direction }
  end,
}

-- tmux display-popup: run a command (or a shell) in a floating pane over the
-- current window, in the focused pane's directory. Closes when it exits.
rex.action{
  name     = "popup",
  title    = "Open Floating Pane",
  category = "Pane",
  args     = { command = "array?", width = "number?", height = "number?" },
  run      = function(ctx, args)
    local view = rex.session.view{}
    local w = view and util.window_of(view, ctx.block_id)
    local width, height = args.width or 0.8, args.height or 0.8
    local options = { cwd = util.block_cwd(ctx.session_id, ctx.block_id) }
    if args.command then options.command = args.command end
    return rex.session.new_layer{
      window_id = w and w.window_id,
      bounds    = { (1 - width) / 2, (1 - height) / 2, width, height },
      focus     = true,
      layout    = rex.layout.block{ flavor = util.SHELL, options = options },
    }
  end,
}
