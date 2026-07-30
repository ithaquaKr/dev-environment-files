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
    -- Sync the editor palette + `:terminal` colors with the active ghostty
    -- theme (configs/ghostty/config), which uses the stock Tokyo Night ANSI
    -- palette on top of a custom bg/fg/selection.
    on_colors = function(colors)
      local Util = require("teide.util")

      colors.fg = "#E7EAEE"
      colors.fg_dark = "#a9b1d6"
      colors.bg_visual = "#33394a"

      colors.comment = "#565f89"
      colors.dark5 = "#737aa2"
      colors.bg_highlight = "#292e42"
      colors.fg_gutter = "#3b4261"

      colors.red = "#f7768e"
      colors.red1 = "#db4b4b"
      colors.green = "#9ece6a"
      colors.green1 = "#73daca"
      colors.green2 = "#41a6b5"
      colors.yellow = "#e0af68"
      colors.orange = "#ff9e64"
      colors.blue = "#7aa2f7"
      colors.blue0 = "#3d59a1"
      colors.blue1 = "#2ac3de"
      colors.blue2 = "#0db9d7"
      colors.blue5 = "#89ddff"
      colors.blue6 = "#b4f9f8"
      colors.blue7 = "#394b70"
      colors.cyan = "#7dcfff"
      colors.magenta = "#bb9af7"
      colors.magenta2 = "#ff007c"
      colors.purple = "#9d7cd8"
      colors.teal = "#1abc9c"

      colors.git.add = "#449dab"
      colors.git.change = "#6183bb"
      colors.git.delete = "#914c54"

      -- re-derive values that were computed from the fields above
      -- before this hook ran
      colors.error = colors.red1
      colors.warning = colors.yellow
      colors.info = colors.cyan
      colors.hint = colors.teal
      colors.todo = colors.blue
      colors.rainbow = {
        colors.green,
        colors.blue,
        colors.magenta2,
        colors.yellow,
        colors.red,
        colors.teal,
        colors.magenta,
        colors.orange,
      }
      colors.border_highlight = Util.blend_bg(colors.blue1, 0.8)

      -- `:terminal` colors: match ghostty's active ANSI palette exactly
      colors.terminal = {
        black = "#15161e",
        black_bright = "#414868",
        red = "#f7768e",
        red_bright = "#ff899d",
        green = "#9ece6a",
        green_bright = "#9fe044",
        yellow = "#e0af68",
        yellow_bright = "#faba4a",
        blue = "#7aa2f7",
        blue_bright = "#8db0ff",
        magenta = "#bb9af7",
        magenta_bright = "#c7a9ff",
        cyan = "#7dcfff",
        cyan_bright = "#a4daff",
        white = "#a9b1d6",
        white_bright = "#c0caf5",
      }
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
