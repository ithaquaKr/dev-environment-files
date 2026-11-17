-- Keyboard shortcuts. Rex's own cmd shortcuts handle tabs, splits and
-- sessions (cmd+k); these are only what Rex has no default for.
-- Rarely used actions (Rex's Close Other Panes, custom Open Current Directory
-- in Finder) have no key: run them from the command palette (cmd+shift+p).
-- List available actions:  rex -C <client> actions
-- Inspect loaded keymap:   rex keymap

-- Scrollback by page (Rex has no default key; fn+shift+up/down on a laptop)
rex.bind("shift+pageup", "client.scroll.page_up")
rex.bind("shift+pagedown", "client.scroll.page_down")

-- Floating panes (tmux display-popup)
rex.bind("ctrl+cmd+g", "popup", { command = { "lazygit" }, width = 0.9, height = 0.9 })
rex.bind("ctrl+cmd+t", "popup")

-- Neovim-aware pane navigation (vim-tmux-navigator)
rex.bind("ctrl+h", "navigate", { direction = "left" })
rex.bind("ctrl+j", "navigate", { direction = "down" })
rex.bind("ctrl+k", "navigate", { direction = "up" })
rex.bind("ctrl+l", "navigate", { direction = "right" })
