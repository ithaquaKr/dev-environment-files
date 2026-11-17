-- Shared helpers for actions and scripts.

local M = {}

M.TERMINAL = "com.superlogical.terminal"
M.SHELL = "com.superlogical.terminal.shell"

-- Turn a terminal pwd URL (file://host/path) into a plain path.
function M.url_to_path(url)
  if not url then return nil end
  local path = url:gsub("^file://[^/]*", "")
  path = path:gsub("%%(%x%x)", function(h) return string.char(tonumber(h, 16)) end)
  return path ~= "" and path or "/"
end

-- The working directory of a terminal block, as a plain path.
function M.block_cwd(session_id, block_id)
  local r = rex.block.call(M.TERMINAL, "pwd", { session_id = session_id, block_id = block_id })
  return r and M.url_to_path(r.pwd)
end

-- Find the window (from session.view) that holds a block.
function M.window_of(view, block_id)
  for _, w in ipairs(view.windows or {}) do
    for _, layer in ipairs(w.layers or {}) do
      for _, b in ipairs(layer.blocks or {}) do
        if b.block_id == block_id then return w end
      end
    end
  end
end

-- Every block id in a window, across tiled and floating layers.
function M.window_blocks(w)
  local ids = {}
  for _, layer in ipairs(w.layers or {}) do
    for _, b in ipairs(layer.blocks or {}) do
      ids[#ids + 1] = b.block_id
    end
  end
  return ids
end

-- Type ctrl+<letter> into a terminal block, as a real key press and release,
-- so programs using the kitty keyboard protocol (Neovim) see the right key.
function M.send_ctrl_key(session_id, block_id, letter)
  local key = {
    key = "key_" .. letter,
    mods = "ctrl",
    consumed_mods = "",
    text = "",
    unshifted_codepoint = string.byte(letter),
    composing = false,
  }
  for _, action in ipairs({ "press", "release" }) do
    key.action = action
    local ok, err = rex.call("block.event", {
      session_id = session_id,
      block_id = block_id,
      event = { type = "key", payload = key },
    })
    if not ok then return nil, err end
  end
  return true
end

return M
