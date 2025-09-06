return {
  { -- Telescope: Fuzzy finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },

    lazy = false,

    opts = {
      defaults = {
        path_display = {
          filename_first = {
            reverse_directories = true,
          },
        },
        layout_config = {
          horizontal = {
            prompt_position = 'top',
          },
        },
        sorting_strategy = 'ascending',
      },
    },

    config = function(_, opts)
      local telescope = require 'telescope'
      local actions = require 'telescope.actions'
      local builtin = require 'telescope.builtin'
      local themes = require 'telescope.themes'

      local nor_tel_keybinds = {
        ['d'] = actions.delete_buffer,
        ['<C-h>'] = actions.preview_scrolling_left,
        ['<C-j>'] = actions.preview_scrolling_down,
        ['<C-k>'] = actions.preview_scrolling_up,
        ['<C-l>'] = actions.preview_scrolling_right,
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        ['<M-q>'] = actions.toggle_all + actions.send_selected_to_qflist + actions.open_qflist,
        ['<C-f>'] = nil,
        ['<M-f>'] = nil,
        ['<M-h>'] = actions.results_scrolling_left,
        ['<M-l>'] = actions.results_scrolling_right,
        ['<leader>kj'] = actions.close,
      }

      local ins_tel_keybinds = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
        ['<M-q>'] = actions.toggle_all + actions.send_selected_to_qflist + actions.open_qflist,
        ['<leader>kj'] = actions.close,
      }

      opts = vim.tbl_deep_extend('force', opts, {
        defaults = {
          mappings = {
            n = nor_tel_keybinds,
            i = ins_tel_keybinds,
          },
        },
      })

      telescope.setup(opts)

      vim.keymap.set('n', '<leader>sd', '<CMD>Telescope diagnostics initial_mode=normal<CR>', { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sf', '<CMD>Telescope find_files<CR>', { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sg', '<CMD>Telescope live_grep<CR>', { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sgf', '<CMD>Telescope git_files<CR>', { desc = '[S]earch [G]it [F]iles' })
      vim.keymap.set('n', '<leader>sh', '<CMD>Telescope help_tags<CR>', { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>shf', '<CMD>Telescope find_files hidden=true no_ignore=true<CR>', { desc = '[S]earch [H]idden [F]iles' })
      vim.keymap.set('n', '<leader>sj', '<CMD>Telescope jumplist initial_mode=normal<CR>', { desc = '[S]earch [J]umplist' })
      vim.keymap.set('n', '<leader>sk', '<CMD>Telescope keymaps<CR>', { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sm', '<CMD>Telescope marks<CR>', { desc = '[S]earch [M]arks' })
      vim.keymap.set('n', '<leader>so', '<CMD>Telescope vim_options<CR>', { desc = '[S]earch Vim-[O]ptions' })
      vim.keymap.set('n', '<leader>sr', '<CMD>Telescope registers initial_mode=normal<CR>', { desc = '[S]earch [R]egisters' })
      vim.keymap.set('n', '<leader>srs', '<CMD>Telescope resume<CR>', { desc = '[S]earch [R]e[S]ume' })
      vim.keymap.set('n', '<leader>ss', '<CMD>Telescope builtin<CR>', { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>st', '<CMD>Telescope treesitter<CR>', { desc = '[S]earch [T]reesitter' })
      vim.keymap.set('n', '<leader>sw', '<CMD>Telescope grep_string<CR>', { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sz', '<CMD>Telescope spell_suggest initial_mode=normal<CR>', { desc = '[S]earch Spell Suggest' })
      vim.keymap.set('n', '<leader>s.', '<CMD>Telescope oldfiles<CR>', { desc = '[S]earch Recent Files [.] for repeat' })

      vim.keymap.set(
        'n',
        '<leader>s/',
        '<CMD>Telescope live_grep prompt_title="Live Grep in Open Files" grep_open_files=true',
        { desc = '[S]earch [/] in Open Files' }
      )

      vim.keymap.set(
        'n',
        '<leader><leader>',
        '<CMD>Telescope buffers ignore_current_buffer=true sort_mru=true initial_mode=normal<CR>',
        { desc = '[ ] Find existing buffers' }
      )

      vim.keymap.set('n', '<leader>snv', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eo[V]im files' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown { previewer = false })
      end, { desc = '[/] Fuzzily search in current buffer' })
    end,
  },

  { -- Telescope FZF Native: Telescope dependency
    'nvim-telescope/telescope-fzf-native.nvim',

    lazy = true,

    event = 'VeryLazy',

    build = 'make',

    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        },
      },
    },

    config = function(_, opts)
      local telescope = require 'telescope'
      telescope.setup(opts)

      pcall(telescope.load_extension, 'fzf')
    end,
  },
}
