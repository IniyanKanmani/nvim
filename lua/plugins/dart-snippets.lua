return {
  { -- Dart Snippets: Generate Dart Data Class
    'IniyanKanmani/dart-snippets.nvim',

    lazy = true,

    ft = { 'dart' },

    opts = {
      data_class = {
        hash_code = false,
        operator = false,
      },
    },
  },
}
