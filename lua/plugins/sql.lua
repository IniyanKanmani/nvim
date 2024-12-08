return {
  { -- Vim DadBod: Database plugin for nvim
    'tpope/vim-dadbod',

    lazy = true,

    ft = { 'sql', 'mysql', 'plsql' },

    cmd = { 'DB' },

    keys = {
      { '<leader>dx', "<CMD>'<,'>DB<CR>", mode = { 'n', 'v' }, desc = 'DB Execute Selection' },
      { '<leader>df', '<CMD>%DB<CR>', mode = { 'n', 'v' }, desc = 'DB Execute File' },
      { '<leader>db', '<CMD>DB BEGIN<CR>', mode = 'n', desc = 'DB Execute BEGIN;' },
      { '<leader>dc', '<CMD>DB COMMIT<CR>', mode = 'n', desc = 'DB Execute COMMIT;' },
      { '<leader>dr', '<CMD>DB ROLLBACK<CR>', mode = 'n', desc = 'DB Execute ROLLBACK;' },
    },

    config = function()
      vim.g.dbs = dofile(vim.fn.expand '~' .. '/.local/share/dadbod/connections.lua')
    end,
  },

  { -- Vim DadBod Ui: Ui for DadBod
    'kristijanhusak/vim-dadbod-ui',

    lazy = true,

    ft = { 'sql', 'mysql', 'plsql' },

    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },

    keys = {
      { '<leader>du', '<CMD>DBUIToggle<CR>', desc = 'Toggle DB UI' },
      { '<leader>dl', '<CMD>DBUILastQueryInfo<CR>', desc = 'Last Query Info' },
    },

    init = function()
      local function ensure_directory(path)
        path = vim.fn.expand(path)
        if vim.fn.isdirectory(path) == 0 then
          vim.fn.mkdir(path, 'p')
        end
      end

      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_show_database_icon = 1
      vim.g.db_ui_execute_on_save = false
      vim.g.db_ui_save_location = '~/.local/share/nvim/dadbod/data'
      vim.g.db_ui_tmp_query_location = '~/.local/share/nvim/dadbod/queries'

      ensure_directory(vim.g.db_ui_save_location)
      ensure_directory(vim.g.db_ui_tmp_query_location)
    end,
  },

  { -- Vim DadBod Completion: Completion for DadBod
    'kristijanhusak/vim-dadbod-completion',

    lazy = true,

    ft = { 'sql', 'mysql', 'plsql' },
  },
}
