return {
  { -- Dart Snippets: Generate Dart Data Class
    'IniyanKanmani/dart-snippets.nvim',

    lazy = true,

    cmd = 'GenerateDartDataClass',

    opts = {
      data_class = {
        hash_code = false,
        operator = false,
      },
    },
  },
}
