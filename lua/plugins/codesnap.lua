return {
  { -- Codesnap: Snapshot code
    'mistricky/codesnap.nvim',

    lazy = true,

    build = 'make build_generator',

    keys = {
      { '<leader>cc', '<CMD>CodeSnap<CR>', mode = 'x', desc = 'Save selected code snapshot into clipboard' },
      { '<leader>cs', '<CMD>CodeSnapSave<CR>', mode = 'x', desc = 'Save selected code snapshot in ~/Pictures' },
    },

    opts = {
      border = 'rounded',
      save_path = '~/Pictures',
      has_breadcrumbs = true,
      bg_theme = 'grape',
      watermark = '',
    },
  },
}
