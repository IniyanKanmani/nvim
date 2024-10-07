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

    keys = {
      { '<leader>sh', '<CMD>Telescope help_tags<CR>', mode = 'n', desc = '[S]earch [H]elp' },
      { '<leader>sk', '<CMD>Telescope keymaps<CR>', mode = 'n', desc = '[S]earch [K]eymaps' },
      { '<leader>sf', '<CMD>Telescope find_files<CR>', mode = 'n', desc = '[S]earch [F]iles' },
      { '<leader>sgf', '<CMD>Telescope git_files<CR>', mode = 'n', desc = '[S]earch [G]it [F]iles' },
      { '<leader>ss', '<CMD>Telescope builtin<CR>', mode = 'n', desc = '[S]earch [S]elect Telescope' },
      { '<leader>sw', '<CMD>Telescope grep_string<CR>', mode = 'n', desc = '[S]earch current [W]ord' },
      { '<leader>sg', '<CMD>Telescope live_grep<CR>', mode = 'n', desc = '[S]earch by [G]rep' },
      { '<leader>sd', '<CMD>Telescope diagnostics<CR>', mode = 'n', desc = '[S]earch [D]iagnostics' },
      { '<leader>st', '<CMD>TodoTelescope<CR>', mode = 'n', desc = '[S]earch [T]odos' },
      { '<leader>sr', '<CMD>Telescope resume<CR>', mode = 'n', desc = '[S]earch [R]esume' },
      { '<leader>s.', '<CMD>Telescope oldfiles<CR>', mode = 'n', desc = '[S]earch Recent Files "." for repeat' },
      { '<leader><leader>', '<CMD>Telescope buffers<CR>', mode = 'n', desc = '[ ] Find existing buffers' },
      {
        '<leader>/',
        function()
          require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
          })
        end,
        mode = 'n',
        desc = '[/] Fuzzily search in current buffer',
      },
      {
        '<leader>s/',
        function()
          require('telescope.builtin').live_grep {
            grep_open_files = true,
            prompt_title = 'Live Grep in Open Files',
          }
        end,
        mode = 'n',
        desc = '[S]earch [/] in Open Files',
      },
      {
        '<leader>sn',
        function()
          require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
        end,
        mode = 'n',
        desc = '[S]earch [N]eovim files',
      },
    },

    opts = {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
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
      require('telescope').setup(opts)

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
