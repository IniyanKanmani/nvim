return {
  { -- Outline Nvim: Show outline of buffer
    'hedyhli/outline.nvim',

    lazy = true,

    cmd = { 'Outline' },

    keys = {
      {
        '<leader>ol',
        '<CMD>Outline<CR>',
        mode = 'n',
        desc = 'Toggle outline',
      },
    },

    opts = {
      outline_window = {
        auto_close = true,
        auto_jump = true,
        show_numbers = true,
        show_relative_numbers = true,
      },
      symbol_folding = {
        autofold_depth = false,
      },
    },
  },
}
