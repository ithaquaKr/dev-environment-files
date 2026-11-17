-- Name each tab after its focused pane's directory, like tmux
-- `automatic-rename-format '#{b:pane_current_path}'`. A tab renamed by hand
-- keeps its name. Started by autostart.lua; run by hand with:
--   rex do --all ~/.config/rex/scripts/tab-autoname.lua

package.path = os.getenv("HOME") .. "/.config/rex/?.lua;" .. package.path
local util = require("util")

local STATE = os.getenv("HOME") .. "/.cache/rex-tab-autoname.json"

-- window_id -> label this script set, so a hand-set label is left alone.
local auto = {}
do
  local f = io.open(STATE)
  if f then
    auto = rex.json.decode(f:read("*a")) or {}
    f:close()
  end
end

local function save()
  local f = io.open(STATE, "w")
  if f then
    f:write(rex.json.encode(auto) or "{}")
    f:close()
  end
end

local function dir_name(path)
  if not path then return nil end
  path = path:gsub("/+$", "")
  if path == "" then return "/" end
  if path == os.getenv("HOME") then return "~" end
  return path:match("([^/]+)$")
end

local function apply(session_id, w, path)
  local label = w.label or ""
  local is_default = label:match("^Window %x+$") ~= nil
  if not is_default and label ~= auto[w.window_id] then return end
  local name = dir_name(path)
  if not name or name == label then return end
  auto[w.window_id] = name
  save()
  rex.session.set_window_label{ session_id = session_id, window_id = w.window_id, label = name }
end

rex.on("terminal.pwd_changed", function(ctx, ev)
  local view = rex.session.view{ session_id = ctx.session_id }
  local w = view and util.window_of(view, ctx.block_id)
  if w and w.focused_block_id == ctx.block_id then
    apply(ctx.session_id, w, util.url_to_path(ev.pwd))
  end
end)

-- Focus moved to another pane: follow its directory (tmux uses the active pane).
local last_focus = {}
rex.on("session_view_changed", function(ctx, ev)
  local view = rex.session.view{ session_id = ctx.session_id }
  for _, w in ipairs(view and view.windows or {}) do
    local b = w.focused_block_id
    if b and last_focus[w.window_id] ~= b then
      last_focus[w.window_id] = b
      apply(ctx.session_id, w, util.block_cwd(ctx.session_id, b))
    end
  end
end)

rex.on("window_closed", function(ctx, ev)
  last_focus[ev.window_id] = nil
  if auto[ev.window_id] then
    auto[ev.window_id] = nil
    save()
  end
end)

-- On start, name the tabs that already exist. Deferred with rex.after: the
-- script is only attached to every session once its top level has finished.
rex.after(0, function()
  local list = rex.call("session.list", {})
  for _, s in ipairs(list and list.sessions or {}) do
    local view = rex.session.view{ session_id = s.session_id }
    for _, w in ipairs(view and view.windows or {}) do
      local b = w.focused_block_id
      if b then
        last_focus[w.window_id] = b
        apply(s.session_id, w, util.block_cwd(s.session_id, b))
      end
    end
  end
end)
