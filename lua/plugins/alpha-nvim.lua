return {
  { -- Alpha Nvim: Dashboard Theme
    'goolord/alpha-nvim',

    event = 'VimEnter',

    config = function()
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == 'lazy' then
        vim.cmd.close()
        vim.api.nvim_create_autocmd('alpha-nvim', {
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
        dashboard.button('e', '  > New file', '<CMD>ene <BAR> startinsert <CR>'),
        dashboard.button('SPC -', '  > Browse files'),
        dashboard.button('SPC s f', '󰮗  > Find file'),
        dashboard.button('SPC q l', '󰪻  > Recent CWD Session'),
        dashboard.button('SPC q r', '  > Recent Session'),
        dashboard.button('s', '  > Settings', '<CMD>e $MYVIMRC<CR>'),
        dashboard.button('q', '  > Quit NVIM', '<CMD>qa<CR>'),
      }

      dashboard.config.layout = {
        { type = 'padding', val = 15 },
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
