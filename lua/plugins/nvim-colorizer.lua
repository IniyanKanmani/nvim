return {
  { -- Nvim Colorizer: Visualize color
    'norcalli/nvim-colorizer.lua',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
      '*',
      css = {
        rgb_fn = true,
      },
    },

    config = function(_, opts)
      local colorizer = require 'colorizer'
      colorizer.setup(opts)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'lazy', 'mason', 'noice', 'oil', 'snacks_notif', 'TelescopePrompt', 'TelescopeResults' },
        callback = function()
          colorizer.detach_from_buffer()
        end,
      })
    end,
  },
}
