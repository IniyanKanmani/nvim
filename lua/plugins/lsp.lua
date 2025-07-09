return { -- LSP
  { -- Nvim Lspconfig: Configure LSP
    'neovim/nvim-lspconfig',

    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'antosha417/nvim-lsp-file-operations',
      'j-hui/fidget.nvim',

      'williamboman/mason-lspconfig.nvim',
    },

    lazy = true,

    event = { 'BufReadPost', 'BufNewFile' },

    config = function()
      local lspconfig = require 'lspconfig'
      local cmp_nvim_lsp = require 'cmp_nvim_lsp'

      OnAttach = function(client, bufnr)
        local keymap = function(mode, lhs, rhs, opts)
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        -- Show Documentation for word under the cursor
        keymap('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', { desc = 'LSP Show Documentation' })

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        keymap('n', 'gd', '<CMD>Telescope lsp_definitions<CR>', { desc = 'LSP [G]oto [D]efinition' })

        --  This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        keymap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>', { desc = 'LSP [G]oto [D]eclaration' })

        -- Find references for the word under your cursor.
        keymap('n', 'gr', '<CMD>Telescope lsp_references<CR>', { desc = 'LSP [G]oto [R]eferences' })

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        keymap('n', 'gi', '<CMD>Telescope lsp_implementations<CR>', { desc = 'LSP [G]oto [I]mplementation' })

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        keymap('n', 'gtd', '<CMD>Telescope lsp_type_definitions<CR>', { desc = 'LSP [G]oto [T]ype [D]efinition' })

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        keymap('n', 'gds', '<CMD>Telescope lsp_document_symbols<CR>', { desc = 'LSP [G]oto [D]ocument [S]ymbols' })

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        keymap('n', 'gws', '<CMD>Telescope lsp_dynamic_workspace_symbols<CR>', { desc = 'LSP [G]oto [W]orkspace [S]ymbols' })

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        keymap('n', '<leader>rn', '<CMD>lua vim.lsp.buf.rename()<CR>', { desc = 'LSP [R]e[n]ame' })

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        keymap('n', '<leader>ca', '<CMD>lua vim.lsp.buf.code_action()<CR>', { desc = 'LSP [C]ode [A]ction' })
        keymap('x', '<leader>ca', '<CMD>lua vim.lsp.buf.code_action()<CR>', { desc = 'LSP [C]ode [A]ction' })

        -- Restart LSP
        keymap('n', '<leader>rs', '<CMD>LspRestart<CR>', { desc = 'LSP [R]e[s]tart' })

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        -- local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          keymap(
            'n',
            '<leader>th',
            '<CMD>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr })<CR>',
            { desc = '[T]oggle Inlay [H]ints' }
          )
        end
      end

      local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
      end

      Capabilities = cmp_nvim_lsp.default_capabilities()

      lspconfig['lua_ls'].setup {
        capabilities = Capabilities,
        on_attach = OnAttach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      }

      lspconfig['marksman'].setup {
        capabilities = Capabilities,
        on_attach = OnAttach,
      }

      lspconfig['pyright'].setup {
        capabilities = Capabilities,
        on_attach = OnAttach,
      }

      lspconfig['ts_ls'].setup {
        capabilities = Capabilities,
        on_attach = OnAttach,
        init_options = {
          preferences = {
            disableSuggestions = true,
          },
        },
      }

      lspconfig['yamlls'].setup {
        capabilities = Capabilities,
        on_attach = OnAttach,
      }
    end,
  },

  { -- Fidget Nvim: LSP loading animation
    'j-hui/fidget.nvim',

    lazy = true,

    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
    },
  },
}
