-- Start long-running `rex do` scripts once per server. Reloading the config
-- doesn't start duplicates: a script already running is left alone.

local here = (os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")) .. "/rex/"

-- The server's PATH may not include the CLI, so fall back to the app bundle.
local REX_BIN = "rex"
for _, path in ipairs({
  os.getenv("HOME") .. "/Library/Application Support/com.superlogical.rex/RexServer/Versions/Current/Rex Server.app/Contents/MacOS/rex",
  "/opt/homebrew/bin/rex",
  "/usr/local/bin/rex",
}) do
  local f = io.open(path)
  if f then f:close(); REX_BIN = path; break end
end

local scripts = {
  "tab-autoname.lua", -- name tabs after the focused pane's directory
}

local function running(name)
  local r = rex.exec({ "pgrep", "-f", "rex do .*" .. name })
  return r and r.ok
end

for _, name in ipairs(scripts) do
  if not running(name) then
    local h, err = rex.exec.start(
      { REX_BIN, "do", "--all", here .. "scripts/" .. name },
      { detach = true, stdout = false, stderr = false }
    )
    if not h then rex.log("warn", "autostart " .. name .. ": " .. tostring(err)) end
  end
end
