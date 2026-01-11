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
