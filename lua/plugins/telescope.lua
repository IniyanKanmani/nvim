return {
  { -- Telescope: Fuzzy finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },

    lazy = true,

    event = 'VimEnter',

    opts = {
      defaults = {
        path_display = {
          filename_first = {
            reverse_directories = true,
          },
        },
        -- path_display = { 'smart' },
        mappings = {
          n = {
            ['d'] = require('telescope.actions').delete_buffer,
            ['<C-q>'] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist,
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
      telescope.setup(opts)

      local builtin = require 'telescope.builtin'
      local themes = require 'telescope.themes'

      -- Set Telescope keymaps
      vim.keymap.set('n', '<leader>sc', '<CMD>Telescope neoclip initial_mode=normal<CR>', { desc = '[S]earch [C]lipboard' })
      vim.keymap.set('n', '<leader>sd', '<CMD>Telescope diagnostics initial_mode=normal<CR>', { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sf', '<CMD>Telescope find_files<CR>', { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sff', '<CMD>Telescope frecency prompt_title=frecency workspace=CWD<CR>', { desc = '[S]earch [F]recency [F]iles' })
      vim.keymap.set('n', '<leader>sg', '<CMD>Telescope live_grep<CR>', { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sgf', '<CMD>Telescope git_files<CR>', { desc = '[S]earch [G]it [F]iles' })
      vim.keymap.set('n', '<leader>sh', '<CMD>Telescope help_tags<CR>', { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>shf', '<CMD>Telescope find_files hidden=true<CR>', { desc = '[S]earch [H]idden [F]iles' })
      vim.keymap.set('n', '<leader>shg', '<CMD>Telescope helpgrep<CR>', { desc = '[S]earch [H]elp [G]rep' })
      vim.keymap.set('n', '<leader>sj', '<CMD>Telescope jumplist initial_mode=normal<CR>', { desc = '[S]earch [J]umplist' })
      vim.keymap.set('n', '<leader>sk', '<CMD>Telescope keymaps<CR>', { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sm', '<CMD>Telescope marks<CR>', { desc = '[S]earch [M]arks' })
      vim.keymap.set('n', '<leader>sn', '<CMD>Telescope notify initial_mode=normal<CR>', { desc = '[S]earch [N]otifications' })
      vim.keymap.set('n', '<leader>so', '<CMD>Telescope vim_options<CR>', { desc = '[S]earch Vim-[O]ptions' })
      vim.keymap.set('n', '<leader>sr', '<CMD>Telescope registers initial_mode=normal<CR>', { desc = '[S]earch [R]egisters' })
      vim.keymap.set('n', '<leader>srs', '<CMD>Telescope resume<CR>', { desc = '[S]earch [R]e[S]ume' })
      vim.keymap.set('n', '<leader>ss', '<CMD>Telescope builtin<CR>', { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>ssp', '<CMD>Telescope spell_suggest initial_mode=normal<CR>', { desc = '[S]earch [S][P]ell Suggest' })
      vim.keymap.set('n', '<leader>st', '<CMD>Telescope treesitter<CR>', { desc = '[S]earch [T]reesitter' })
      vim.keymap.set('n', '<leader>su', '<CMD>Telescope undo initial_mode=normal<CR>', { desc = '[S]earch [U]ndo History' })
      vim.keymap.set('n', '<leader>sw', '<CMD>Telescope grep_string<CR>', { desc = '[S]earch current [W]ord' })
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

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(themes.get_dropdown { previewer = false })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>snv', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eo[V]im files' })

      -- Create Autocmd to load other plugins that depend on telescope
      -- vim.api.nvim_exec_autocmds('User', { pattern = 'TelescopeLoaded' })
      vim.cmd 'doautocmd User TelescopeLoaded'
    end,
  },

  { -- Telescope FZF Native: Telescope dependency
    'nvim-telescope/telescope-fzf-native.nvim',

    lazy = true,

    event = 'User TelescopeLoaded',

    --  If encountering errors, see telescope-fzf-native README for installation instructions
    -- `build` is used to run some command when the plugin is installed/updated.
    -- This is only run then, not every time Neovim starts up.
    build = 'make',

    -- `cond` is a condition used to determine whether this plugin should be
    -- installed and loaded.
    cond = function()
      return vim.fn.executable 'make' == 1
    end,

    opts = {},

    config = function(_, opts)
      local telescope = require 'telescope'
      telescope.setup(opts)

      pcall(require('telescope').load_extension, 'fzf')
    end,
  },

  { -- Telescope Ui Select Nvim: Better UI for drop-down
    'nvim-telescope/telescope-ui-select.nvim',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },
    -- event = 'User TelescopeLoaded',

    opts = {
      extensions = {
        ['ui-select'] = function()
          require('telescope.themes').get_dropdown()
        end,
      },
    },

    config = function(_, opts)
      local telescope = require 'telescope'
      telescope.setup(opts)

      pcall(telescope.load_extension, 'ui-select')
    end,
  },

  { -- Telescope Frecency: Intelligent Prioritization when selecting files from your editing history
    'nvim-telescope/telescope-frecency.nvim',

    lazy = true,

    event = 'User TelescopeLoaded',

    opts = {
      extensions = {
        frecency = {
          show_scores = true,
          show_filter_column = false,
          db_safe_mode = false,
          auto_validate = true,
        },
      },
    },

    config = function(_, opts)
      local telescope = require 'telescope'
      telescope.setup(opts)

      pcall(telescope.load_extension, 'frecency')
    end,
  },

  { -- Telescope Help Grep: Grep through Help files
    'catgoose/telescope-helpgrep.nvim',

    lazy = true,

    event = 'User TelescopeLoaded',

    opts = {},

    config = function(_, opts)
      local telescope = require 'telescope'
      telescope.setup(opts)

      pcall(telescope.load_extension, 'helpgrep')
    end,
  },

  { -- Telescope Undo Nvim: View editing history with telescope
    'debugloop/telescope-undo.nvim',

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },
    -- event = 'User TelescopeLoaded',

    opts = {},

    config = function(_, opts)
      local telescope = require 'telescope'
      telescope.setup(opts)

      pcall(telescope.load_extension, 'undo')
    end,
  },
}
