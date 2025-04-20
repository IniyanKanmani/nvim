return {
  { -- Term Transparency: Toggle transparency of Neovim and Wezterm
    'IniyanKanmani/term-transparency.nvim',

    dependencies = {
      'folke/tokyonight.nvim',
      'nvim-lualine/lualine.nvim',
    },

    lazy = false,

    priority = 1000,

    opts = {
      term = {
        kitty = {
          enabled = true,
          socket = '/tmp/kitty.sock', -- socket that kitty listens to
        },
        wezterm = {
          enabled = true,
        },
      },
      notifications = {
        enabled = true,
      },
      on_transparency_change = function()
        require('tokyonight').setup(vim.g.is_transparent and TokyoNightTransparentThemeOpts or TokyoNightNormalThemeOpts)
        require('lualine').setup(vim.g.is_transparent and LualineTransparentThemeOpts or LualineNormalThemeOpts)

        vim.cmd.colorscheme 'tokyonight-night'
      end,
    },

    config = function(_, opts)
      local term_transparency = require 'term_transparency'
      term_transparency.setup(opts)

      vim.keymap.set('n', '<leader>bt', '<CMD>ToggleTermTransparency<CR>', { desc = 'Toggle Terminal Transparency' })

      vim.api.nvim_set_hl(0, 'SpellBad', { underline = true, sp = 'red' }) -- Underline with red color
      vim.api.nvim_set_hl(0, 'SpellCap', { underline = true, sp = 'blue' }) -- Underline with blue color
      vim.api.nvim_set_hl(0, 'SpellRare', { underline = true, sp = 'purple' }) -- Underline with purple color
      vim.api.nvim_set_hl(0, 'SpellLocal', { underline = true, sp = 'yellow' }) -- Underline with yellow color
    end,
  },
}
