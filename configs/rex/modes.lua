-- Key modes: shortcuts that only apply while the mode is active.
-- Docs: https://www.superlogical.com/rex/docs/customize/key-modes

-- Resize mode, entered by ctrl+cmd+r.
-- Exclusive, so stray keys don't type into the terminal. Escape/enter leaves.
rex.mode("resize", { exclusive = true })
rex.bind("ctrl+cmd+r", "client.mode.enter", { name = "resize" })

local dirs = { h = "left", j = "down", k = "up", l = "right" }
for key, dir in pairs(dirs) do
  rex.bind("resize/" .. key, "pane.resize", { direction = dir })
  rex.bind("resize/" .. dir, "pane.resize", { direction = dir })
  rex.bind("resize/shift+" .. key, "pane.resize", { direction = dir, amount = 15 })
end
rex.bind("resize/=", "pane.balance")
rex.bind("resize/m", "pane.zoom")
rex.bind("resize/escape", "client.mode.exit")
rex.bind("resize/enter", "client.mode.exit")
