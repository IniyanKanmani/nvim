return {
  { -- Alpha Nvim: Dashboard Theme
    'goolord/alpha-nvim',

    lazy = false,

    config = function()
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == 'lazy' then
        vim.cmd.close()
        vim.api.nvim_create_autocmd('User', {
          once = true,
          pattern = 'AlphaReady',
          callback = function()
            require('lazy').show()
          end,
        })
      end

      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      dashboard.section.buttons.val = {
        dashboard.button('e', '  > New File', '<CMD>ene <BAR> startinsert <CR>'),
        dashboard.button('SPC =', '  > Browse Files'),
        dashboard.button('SPC s f', '󰮗  > Find File'),
        dashboard.button('SPC l g', '  > Git Status'),
        dashboard.button('SPC q l', '󰪻  > Recent CWD Session'),
        dashboard.button('SPC q r', '  > Recent Session'),
        dashboard.button('q', '  > Quit Nvim', '<CMD>qa<CR>'),
      }

      dashboard.config.layout = {
        { type = 'padding', val = 13 },
        dashboard.section.header,
        { type = 'padding', val = 3 },
        dashboard.section.buttons,
        { type = 'padding', val = 2 },
        dashboard.section.footer,
      }

      alpha.setup(dashboard.config)
    end,
  },
}
