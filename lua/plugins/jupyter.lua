return {
  { -- NotebookNavigator Nvim: Navigate jupyter notebook in neovim
    'IniyanKanmani/notebook-navigator.nvim',

    dependencies = {
      'IniyanKanmani/jupytext.nvim',
      'SUSTech-data/neopyter',
      'benlubas/molten-nvim',
      'echasnovski/mini.ai',
      'echasnovski/mini.hipatterns',
    },

    lazy = true,

    event = { 'BufReadCmd *.ipynb', 'BufNewFile *.ipynb' },

    opts = {
      cell_markers = {
        python = '# %%',
      },
      activate_hydra_keys = nil,
      show_hydra_hint = false,
      repl_provider = 'molten',
      syntax_highlight = false,
      cell_highlight_group = 'Folded',
    },

    config = function(_, opts)
      local nn = require 'notebook-navigator'
      nn.setup(opts)

      local check_neopyter_buffers = function(bufnr)
        for _, nr in ipairs(vim.g.neopyter_buffers) do
          if nr == bufnr then
            return true
          end
          return false
        end
      end

      local navigator_leader = ','

      vim.keymap.set('n', navigator_leader .. 'k', function()
        nn.move_cell 'u'
      end, { desc = 'Move cell up' })

      vim.keymap.set('n', navigator_leader .. 'j', function()
        nn.move_cell 'd'
      end, { desc = 'Move cell down' })

      vim.keymap.set('n', navigator_leader .. 'R', function()
        if vim.g.current_jupyter_repl == 0 then
          nn.run_cell()
        elseif vim.g.current_jupyter_repl == 1 then
          local neo = check_neopyter_buffers(vim.api.nvim_get_current_buf())
          if neo then
            vim.cmd 'Neopyter run current'
          end
        elseif vim.g.current_jupyter_repl == 2 then
          nn.run_cell()

          local neo = check_neopyter_buffers(vim.api.nvim_get_current_buf())
          if neo then
            vim.cmd 'Neopyter run current'
          end
        end
      end, { desc = 'Run current cell' })

      vim.keymap.set('n', navigator_leader .. 'r', function()
        if vim.g.current_jupyter_repl == 0 then
          nn.run_and_move()
        elseif vim.g.current_jupyter_repl == 1 then
          local neo = check_neopyter_buffers(vim.api.nvim_get_current_buf())
          if neo then
            vim.cmd 'Neopyter run current'
            nn.move_cell 'd'
          end
        elseif vim.g.current_jupyter_repl == 2 then
          local neo = check_neopyter_buffers(vim.api.nvim_get_current_buf())
          if neo then
            vim.cmd 'Neopyter run current'
          end

          nn.run_and_move()
        end
      end, { desc = 'Run and move to next cell' })

      vim.keymap.set('n', navigator_leader .. 'rr', function()
        if vim.g.current_jupyter_repl == 0 then
          nn.run_all_cells()
        elseif vim.g.current_jupyter_repl == 1 then
          local neo = check_neopyter_buffers(vim.api.nvim_get_current_buf())
          if neo then
            vim.cmd 'Neopyter run all'
            vim.cmd 'normal G'
          end
        elseif vim.g.current_jupyter_repl == 2 then
          nn.run_all_cells()

          local neo = check_neopyter_buffers(vim.api.nvim_get_current_buf())
          if neo then
            vim.cmd 'Neopyter run all'
          end
        end
      end, { desc = 'Run all cells' })

      vim.keymap.set('n', navigator_leader .. 'ra', function()
        if vim.g.current_jupyter_repl == 0 then
          nn.run_cells_above()
        elseif vim.g.current_jupyter_repl == 1 then
          local neo = check_neopyter_buffers(vim.api.nvim_get_current_buf())
          if neo then
            vim.cmd 'Neopyter run allAbove'
          end
        elseif vim.g.current_jupyter_repl == 2 then
          nn.run_cells_above()

          local neo = check_neopyter_buffers(vim.api.nvim_get_current_buf())
          if neo then
            vim.cmd 'Neopyter run allAbove'
          end
        end
      end, { desc = 'Run current and above cells' })

      vim.keymap.set('n', navigator_leader .. 'rb', function()
        if vim.g.current_jupyter_repl == 0 then
          nn.run_cells_below()
        elseif vim.g.current_jupyter_repl == 1 then
          local neo = check_neopyter_buffers(vim.api.nvim_get_current_buf())
          if neo then
            vim.cmd 'Neopyter run allBelow'
            vim.cmd 'normal G'
          end
        elseif vim.g.current_jupyter_repl == 2 then
          nn.run_cells_below()

          local neo = check_neopyter_buffers(vim.api.nvim_get_current_buf())
          if neo then
            vim.cmd 'Neopyter run allBelow'
          end
        end
      end, { desc = 'Run current and below cells' })

      vim.keymap.set('n', navigator_leader .. 's', function()
        nn.split_cell()
      end, { desc = 'Split cell at line' })

      vim.keymap.set('n', navigator_leader .. 'm', function()
        nn.merge_cell 'd'
      end, { desc = 'Merge with cell below' })

      vim.keymap.set('n', navigator_leader .. 'M', function()
        nn.merge_cell 'u'
      end, { desc = 'Merge with cell above' })

      vim.keymap.set('n', navigator_leader .. 'sk', function()
        nn.swap_cell 'u'
      end, { desc = 'Swap with cell above' })

      vim.keymap.set('n', navigator_leader .. 'sj', function()
        nn.swap_cell 'd'
      end, { desc = 'Swap with cell below' })

      vim.keymap.set('n', navigator_leader .. 'cc', function()
        nn.comment_cell()
      end, { desc = 'Comment current cell' })

      vim.keymap.set('n', navigator_leader .. 'o', function()
        nn.add_cell_below()
      end, { desc = 'Add cell below' })

      vim.keymap.set('n', navigator_leader .. 'O', function()
        nn.add_cell_above()
      end, { desc = 'Add cell above' })

      vim.keymap.set('n', navigator_leader .. 't', function()
        nn.add_text_cell_below()
      end, { desc = 'Add text cell below' })

      vim.keymap.set('n', navigator_leader .. 'T', function()
        nn.add_text_cell_above()
      end, { desc = 'Add text cell below' })

      vim.keymap.set('n', navigator_leader .. 'T', function()
        nn.add_text_cell_above()
      end, { desc = 'Add text cell below' })

      vim.keymap.set('n', navigator_leader .. 'cy', function()
        nn.convert_to_code_cell()
      end, { desc = 'Convert to code cell' })

      vim.keymap.set('n', navigator_leader .. 'cm', function()
        nn.convert_to_markdown_cell()
      end, { desc = 'Convert to markdown cell' })

      vim.keymap.set('n', navigator_leader .. 'va', function()
        nn.visually_select_cell 'a'
      end, { desc = 'Visually select contents around cell' })

      vim.keymap.set('n', navigator_leader .. 'vi', function()
        nn.visually_select_cell 'i'
      end, { desc = 'Visually select contents inside cell' })

      vim.keymap.set('n', navigator_leader .. 'ca', function()
        nn.change_cell 'a'
      end, { desc = 'Change contents around cell' })

      vim.keymap.set('n', navigator_leader .. 'ci', function()
        nn.change_cell 'i'
      end, { desc = 'Change contents inside cell' })

      vim.keymap.set('n', navigator_leader .. 'da', function()
        nn.delete_cell 'a'
      end, { desc = 'Delete contents around cell' })

      vim.keymap.set('n', navigator_leader .. 'di', function()
        nn.delete_cell 'i'
      end, { desc = 'Delete contents inside cell' })

      vim.keymap.set('n', navigator_leader .. 'ns', function()
        vim.cmd 'Neopyter sync current'
      end, { desc = 'Sync current buffer with Neopyter' })

      vim.keymap.set('n', navigator_leader .. 'nr', function()
        vim.cmd 'Neopyter kernel restart'
      end, { desc = 'Restart Neopyter kernel' })

      local create_molten_autocmds = function()
        vim.api.nvim_create_augroup('Molten-Import', { clear = true })
        vim.api.nvim_create_autocmd('BufReadPost', {
          group = 'Molten-Import',
          pattern = '*.ipynb',
          callback = function()
            pcall(vim.cmd(), 'MoltenImportOutput')
          end,
        })

        vim.api.nvim_create_augroup('Molten-Export', { clear = true })
        vim.api.nvim_create_autocmd('BufWritePost', {
          group = 'Molten-Export',
          pattern = '*.ipynb',
          callback = function()
            pcall(vim.cmd(), 'MoltenExportOutput!')
          end,
        })
      end

      local cycle_jupyter_repl = function(is_initial)
        if vim.g.current_jupyter_repl == 0 then
          vim.notify('Using Molten.nvim as repl', vim.log.levels.INFO)

          create_molten_autocmds()
          if not is_initial then
            vim.cmd 'MoltenImportOutput'
          end
        elseif vim.g.current_jupyter_repl == 1 then
          vim.notify('Using Neopyter as repl', vim.log.levels.INFO)

          if not is_initial then
            vim.api.nvim_del_augroup_by_name 'Molten-Import'
            vim.api.nvim_del_augroup_by_name 'Molten-Export'
          end
        elseif vim.g.current_jupyter_repl == 2 then
          vim.notify('Using Molten.nvim and Neopyter as repl', vim.log.levels.INFO)

          create_molten_autocmds()
          if not is_initial then
            vim.cmd 'MoltenImportOutput'
          end
        end
      end

      -- 0: Molten
      -- 1: Neopyter
      -- 2: Molten + Neopyter
      vim.g.current_jupyter_repl = 1
      cycle_jupyter_repl(true)

      vim.keymap.set('n', ',ck', function()
        local current_jupyter_repl = (vim.g.current_jupyter_repl + 1) % 3
        vim.g.current_jupyter_repl = current_jupyter_repl

        cycle_jupyter_repl(false)
      end, { desc = 'Cycle between jupyter repls' })

      -- Mini AI
      local ai = require 'mini.ai'
      local ai_opts = require('lazy.core.config').plugins['mini.ai'].opts or {}

      ai_opts.custom_textobjects = vim.tbl_extend('force', ai_opts.custom_textobjects or {}, {
        j = nn.miniai_spec,
      })

      ---@diagnostic disable-next-line: param-type-mismatch
      ai.setup(ai_opts)

      -- Mini HiPatterns
      local hipatterns = require 'mini.hipatterns'
      local hipatterns_opts = require('lazy.core.config').plugins['mini.hipatterns'].opts or {}

      hipatterns_opts.highlighters = vim.tbl_extend('force', hipatterns_opts.highlighters or {}, {
        cells = nn.minihipatterns_spec,
      })

      ---@diagnostic disable-next-line: param-type-mismatch
      hipatterns.setup(hipatterns_opts)
    end,
  },

  { -- Jupytext Nvim: covnert .ipynb to its equvalient .py
    'IniyanKanmani/jupytext.nvim',

    lazy = true,

    opts = {
      jupytext = 'jupytext',
      format = 'py:percent',
      update = true,
      autosync = false,
      sync_patterns = { '*.md', '*.py', '*.jl', '*.R', '*.Rmd', '*.qmd' },
      handle_url_schemes = false,
    },
  },

  { -- Neopyter: Sync Neovim with Jupyter Lab
    'SUSTech-data/neopyter',

    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      -- 'hrsh7th/nvim-cmp',
      'AbaoFromCUG/websocket.nvim', -- for mode='direct'
    },

    lazy = true,

    opts = {
      mode = 'direct',
      auto_connect = true,
      auto_attach = true,
      remote_address = '127.0.0.1:9001',
      file_pattern = { '*.ju.*', '*.ipynb' },
      on_attach = function(bufnr)
        local bufs = vim.g.neopyter_buffers or {}
        table.insert(bufs, bufnr)
        vim.g.neopyter_buffers = bufs
      end,
      jupyter = {
        auto_activate_file = true,
        partial_sync = false,
        scroll = {
          enable = true,
          align = 'smart',
        },
      },
      highlight = {
        enable = false,
        mode = 'separator',
      },
      textobject = {
        enable = false,
        queries = { 'cellseparator', 'cellcontent', 'cell' },
      },
      parser = {
        python = {},
        trim_whitespace = true,
      },
      injection = {
        enable = true,
      },
    },
    config = function(_, opts)
      local neopyter = require 'neopyter'
      neopyter.setup(opts)

      vim.keymap.set('n', ',nc', '<CMD>Neopyter sync current<CR>', { desc = 'Neopyter sync Nvim and Jupyter Lab' })
      vim.keymap.set('n', ',nr', '<CMD>Neopyter execute docmanager:reload<CR>', { desc = 'Neopyter reload file from disk' })
      vim.keymap.set('n', ',ns', '<CMD>Neopyter execute docmanager:save<CR>', { desc = 'Neopyter save jupyter file to disk' })

      -- -- Nvim-Cmp
      -- local cmp = require 'cmp'
      -- local cmp_opts = require('lazy.core.config').plugins['cmp'].opts or {}
      --
      -- cmp_opts.sources = table.insert(cmp_opts.sources, 2, { name = 'neopyter' })
      --
      -- ---@diagnostic disable-next-line: param-type-mismatch
      -- cmp.setup(cmp_opts)
      --
      -- vim.notify(vim.inspect(cmp_opts), vim.log.levels.INFO)
    end,
  },
}
