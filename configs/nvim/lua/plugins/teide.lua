return {
  "serhez/teide.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "darker", -- The theme comes in four styles, `darker`, `dark`, `dimmed`, and `light`
    light_style = "light", -- The theme is used when the background is set to light
    transparent = true, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value for `:help nvim_set_hl`
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "transparent", -- style for sidebars, see below
      floats = "transparent", -- style for floating windows
    },
    light_brightness = 0.3, -- Adjusts the brightness of the colors of the **Light** style. Number between 0 and 1, from dull to vibrant colors
    dim_inactive = false, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
    -- Palette "Silver Point Accent": the grey neutrals of Rex's dark theme
    -- (Silver Point Dark, themes.json id "silver-point-dark") plus the accent
    -- colors Claude Code uses on its dark theme. Shared with delta, hunk, fzf,
    -- lazygit, yazi, k9s, btop and starship; change them together.
    --   neutrals  #131313 bg   #1a1a1a bg_dark  #232323 raised  #333333 border
    --             #474747 border_strong  #666666 comment  #898989 dim  #b4b4b4 fg  #f4f4f4 bright
    --   accents   #b1b9f9 lavender  #af87ff purple  #4eba65 green  #d77757 orange
    --             #ffc107 yellow    #ff6b80 red     #6cb6ad teal   #fd5db1 pink
    -- Light mode keeps teide's own light palette.
    on_colors = function(colors)
      if vim.o.background ~= "dark" then
        return
      end
      local Util = require("teide.util")

      -- neutrals
      colors.bg = "#131313"
      colors.bg_dark = "#1a1a1a"
      colors.bg_darker = "#111111"
      colors.bg_dimmed = "#161616"
      colors.bg_highlight = "#232323"
      colors.bg_visual = "#363636"
      colors.fg = "#b4b4b4"
      colors.fg_dark = "#898989"
      colors.fg_darker = "#6c6c6c"
      colors.fg_gutter = "#333333"
      colors.comment = "#666666"
      colors.dark3 = "#474747"
      colors.dark5 = "#898989"
      colors.dark6 = "#898989" -- brackets, delimiters
      colors.dark7 = "#b4b4b4" -- fields
      colors.terminal_black = "#666666"

      -- accents (slot -> what teide paints with it)
      colors.red = "#af87ff" -- @keyword, Identifier
      colors.red1 = "#ff6b80" -- errors
      colors.magenta2 = "#af87ff" -- Keyword, Statement, imports
      colors.magenta = "#898989" -- operators
      colors.purple = "#af87ff"
      colors.blue = "#b1b9f9" -- functions, directories, titles
      colors.blue0 = "#2f3150" -- search background
      colors.blue1 = "#b1b9f9"
      colors.blue2 = "#b1b9f9"
      colors.blue5 = "#b4b4b4" -- properties
      colors.blue6 = "#d6d6d6" -- parameters
      colors.blue7 = "#2a2c45"
      colors.cyan = "#b1b9f9" -- info
      colors.cyan2 = "#b1b9f9"
      colors.green = "#4eba65" -- strings, numbers, booleans
      colors.green1 = "#d77757" -- constants
      colors.green2 = "#4eba65"
      colors.teal = "#6cb6ad" -- builtins, hints
      colors.yellow = "#ffc107" -- warnings
      colors.yellow1 = "#6cb6ad" -- types
      colors.orange = "#d77757" -- constructors, special
      colors.orange1 = "#d77757" -- incsearch

      colors.git.add = "#4eba65"
      colors.git.change = "#b1b9f9"
      colors.git.delete = "#ff6b80"

      -- re-derive values that were computed from the fields above
      -- before this hook ran
      Util.bg = colors.bg
      Util.fg = colors.fg
      colors.black = "#1a1a1a"
      colors.border = colors.black
      colors.bg_popup = colors.bg_dark
      colors.bg_statusline = colors.bg_dark
      colors.bg_search = colors.blue0
      colors.fg_sidebar = colors.fg_dark
      colors.fg_sidebar_inactive = colors.fg_darker
      colors.fg_float = colors.fg
      colors.git.ignore = colors.dark3
      colors.diff = {
        add = "#1c3322",
        delete = "#3d1d24",
        change = "#23253a",
        text = "#363a66",
      }
      colors.error = colors.red1
      colors.warning = colors.yellow
      colors.info = colors.cyan
      colors.hint = colors.teal
      colors.todo = "#b1b9f9"
      colors.rainbow = {
        "#b1b9f9",
        "#af87ff",
        "#4eba65",
        "#d77757",
        "#6cb6ad",
        "#ffc107",
        "#fd5db1",
        "#898989",
      }
      colors.border_highlight = "#b1b9f9"

      -- `:terminal` colors (also what claudecode.nvim's terminal shows for
      -- programs that use ANSI colors)
      colors.terminal = {
        black = "#1a1a1a",
        black_bright = "#666666",
        red = "#ff6b80",
        red_bright = "#ff8a9b",
        green = "#4eba65",
        green_bright = "#6fd185",
        yellow = "#ffc107",
        yellow_bright = "#ffd54f",
        blue = "#b1b9f9",
        blue_bright = "#cdd2ff",
        magenta = "#af87ff",
        magenta_bright = "#c6a8ff",
        cyan = "#6cb6ad",
        cyan_bright = "#8fd0c8",
        white = "#b4b4b4",
        white_bright = "#f4f4f4",
      }
    end,
    on_highlights = function(hl, c)
      if vim.o.background ~= "dark" then
        return
      end
      hl.Number = { fg = "#d77757" }
      hl.Boolean = { fg = "#d77757" }
      hl["@string.escape"] = { fg = "#fd5db1" }
      hl["@string.regexp"] = { fg = "#fd5db1" }
      hl.CursorLineNr = { fg = "#d77757", bold = true }
      hl.MatchParen = { fg = "#f4f4f4", bg = "#363636", bold = true }
    end,
    plugins = {

      -- all = package.loaded.lazy == nil,
      all = true,
      -- auto = true,
      -- telescope = true,
      -- fzf = true,
    },
  },
  config = function(_, opts)
    require("teide").setup(opts)
    vim.cmd.colorscheme("teide")
  end,
}
