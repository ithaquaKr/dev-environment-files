-- Rex configuration entry point.
-- Docs: https://www.superlogical.com/rex/docs/customize/config
-- Reload after editing:  rex config reload   (or Reload Config in the palette)
-- Validate without applying:  rex config check

require("actions")    -- custom actions (command palette + bindable)
require("keys")       -- keyboard shortcuts (tmux-style ctrl+s prefix)
require("modes")      -- key modes (resize)
require("hosts")      -- other Rex servers to connect to
require("autostart")  -- background `rex do` scripts
