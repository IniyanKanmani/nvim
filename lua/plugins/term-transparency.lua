return {
  { -- Term Transparency: Toggle transparency of Neovim and Wezterm
    'IniyanKanmani/term-transparency.nvim',

    dependencies = {
      'folke/tokyonight.nvim',
      'nvim-lualine/lualine.nvim',
    },

    event = 'VimEnter',

    priority = 1000,

    opts = {
      transparency_state_file = vim.fn.expand '~' .. '/.local/state/term/transparency.txt',
      term = {
        wezterm = {
          enabled = true,
          transparency_toggle_file = vim.fn.expand '~' .. '/.config/wezterm/toggle_transparency.sh',
        },
      },
      notifications = {
        enabled = false,
      },
      want_autocmd = false,
      on_transparency_change = function()
        local term_transparency = require 'term_transparency'
        term_transparency.sync_state()

        local tokyonight = require 'tokyonight'
        local lualine = require 'lualine'

        tokyonight.setup(vim.g.is_transparent and TokyoNightTransparentThemeOpts or TokyoNightNormalThemeOpts)
        lualine.setup(vim.g.is_transparent and LualineTransparentThemeOpts or LualineNormalThemeOpts)

        vim.cmd.colorscheme 'tokyonight-night'
      end,
    },

    config = function(_, opts)
      local term_transparency = require 'term_transparency'
      term_transparency.setup(opts)

      vim.keymap.set('n', '<leader>bc', function()
        term_transparency.on_transparency_change()
      end, { desc = 'Check Background Transparency' })

      vim.keymap.set('n', '<leader>bt', function()
        term_transparency.toggle_transparency()
      end, { desc = 'Toggle Background Transparency' })
    end,
  },
}
