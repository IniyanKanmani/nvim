return {
  { -- Telescope: Fuzzy finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',

    branch = '0.1.x',

    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-tree/nvim-web-devicons',
    },

    event = 'VimEnter',

    opts = {
      defaults = {
        path_display = { 'smart' },
        mappings = {
          n = {
            ['<C-q'] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist,
            ['<leader>kj'] = require('telescope.actions').close,
          },
          i = {
            ['<C-j'] = require('telescope.actions').move_selection_previous,
            ['<C-k'] = require('telescope.actions').move_selection_next,
            ['<C-q'] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist,
            ['<leader>kj'] = require('telescope.actions').close,
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown,
        },
      },
    },

    config = function(_, opts)
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      local telescope = require 'telescope'
      local builtin = require 'telescope.builtin'
      local themes = require 'telescope.themes'

      telescope.setup(opts)

      -- Set Telescope keymaps
      vim.keymap.set('n', '<leader>sh', '<CMD>Telescope help_tags<CR>', { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', '<CMD>Telescope keymaps<CR>', { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', '<CMD>Telescope find_files<CR>', { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sgf', '<CMD>Telescope git_files<CR>', { desc = '[S]earch [G]it [F]iles' })
      vim.keymap.set('n', '<leader>ss', '<CMD>Telescope builtin<CR>', { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', '<CMD>Telescope grep_string<CR>', { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', '<CMD>Telescope live_grep<CR>', { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', '<CMD>Telescope diagnostics<CR>', { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', '<CMD>Telescope resume<CR>', { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', '<CMD>Telescope oldfiles<CR>', { desc = '[S]earch Recent Files "." for repeat' })
      vim.keymap.set('n', '<leader><leader>', '<CMD>Telescope buffers<CR>', { desc = '[ ] Find existing buffers' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      vim.keymap.set('n', '<leader>snv', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eo[V]im files' })

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
    end,
  },

  { -- Telescope FZF Native: Telescope dependency
    'nvim-telescope/telescope-fzf-native.nvim',

    lazy = true,

    --  If encountering errors, see telescope-fzf-native README for installation instructions
    -- `build` is used to run some command when the plugin is installed/updated.
    -- This is only run then, not every time Neovim starts up.
    build = 'make',

    -- `cond` is a condition used to determine whether this plugin should be
    -- installed and loaded.
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
}
