return {
  "serhez/bento.nvim",
  opts = {
    lock_char = "🔒", -- Character shown before locked buffer names
    max_open_buffers = nil, -- Max buffers (nil = unlimited)
    buffer_deletion_metric = "frecency_access", -- Metric for buffer deletion (see below)
    buffer_notify_on_delete = true, -- Notify when deleting a buffer (false for silent deletion)
    ordering_metric = "access", -- Buffer ordering: nil (arbitrary), "access", or "edit"

    ui = {
      mode = "floating", -- "floating" | "tabline"
      floating = {
        position = "middle-right", -- See position options below
        offset_x = 0, -- Horizontal offset from position
        offset_y = 0, -- Vertical offset from position
        dash_char = "─", -- Character for collapsed dashes
        label_padding = 1, -- Padding around labels
        minimal_menu = nil, -- nil | "dashed" | "filename" | "full"
        max_rendered_buffers = nil, -- nil (no limit) or number for pagination
      },
      tabline = {
        left_page_symbol = "❮", -- Symbol shown when previous buffers exist
        right_page_symbol = "❯", -- Symbol shown when more buffers exist
        separator_symbol = "│", -- Separator between buffer components
      },
    },

    -- Highlight groups (per-action label_* highlights moved to api.register_action `hl`)
    highlights = {
      current = "Bold", -- Current buffer filename (in last editor window)
      active = "Normal", -- Active buffers visible in other windows
      inactive = "Comment", -- Inactive/hidden buffer filenames
      modified = "DiagnosticWarn", -- Modified/unsaved buffer filenames and dashes
      inactive_dash = "Comment", -- Inactive buffer dashes in collapsed state
      previous = "Search", -- Label for previous buffer (last-buffer key label)
      label_minimal = "Visual", -- Labels in collapsed "full" mode
      window_bg = "BentoNormal", -- Menu window background
      page_indicator = "Comment", -- Pagination indicators (● ○ ○ for floating, ❮/❯ for tabline)
      separator = "Normal", -- Separator between buffer components in tabline
    },
  },
  config = function(_, opts)
    require("bento").setup(opts)
    local api = require("bento.api")

    -- v2 registers no keys by default; opt in explicitly
    api.register_expand_key(";") -- Open/expand menu
    api.register_last_buffer_key(";") -- Label for last-accessed buffer
    api.register_collapse_key("<Esc>")
    api.register_prev_page_key("[")
    api.register_next_page_key("]")

    api.register_action("open", { key = "<CR>", action = api.actions.open, hl = "DiagnosticVirtualTextHint" })
    api.register_action("delete", { key = "<BS>", action = api.actions.delete, hl = "DiagnosticVirtualTextError" })
    api.register_action("vsplit", { key = "|", action = api.actions.vsplit, hl = "DiagnosticVirtualTextInfo" })
    api.register_action("split", { key = "_", action = api.actions.split, hl = "DiagnosticVirtualTextInfo" })
    api.register_action("lock", { key = "*", action = api.actions.lock, hl = "DiagnosticVirtualTextWarn" })
    api.set_default_action("open")
  end,
}
