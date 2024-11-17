return {
  { -- Dart Snippets: Generate Dart Data Class
    'IniyanKanmani/dart-snippets.nvim',

    lazy = true,

    event = { 'BufReadPre', 'BufNewFile' },

    opts = {
      data_class = {
        hash_code = false,
        operator = false,
      },
    },
  },
}
