-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  callback = function()
    vim.cmd ':setlocal nonumber norelativenumber'
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local keymap = function(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = event.buf
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Show Documentation for word under the cursor
    keymap('n', 'K', vim.lsp.buf.hover, { desc = 'LSP Show Documentation' })

    --  This is not Goto Definition, this is Goto Declaration.
    keymap('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP [G]oto [D]eclaration' })

    -- Jump to the definition of the word under your cursor.
    keymap('n', 'gd', '<CMD>Telescope lsp_definitions<CR>', { desc = 'LSP [G]oto [D]efinition' })

    -- Find references for the word under your cursor.
    keymap('n', 'grr', '<CMD>Telescope lsp_references<CR>', { desc = 'LSP [G]oto [R]eferences' })

    -- Jump to the implementation of the word under your cursor.
    keymap('n', 'gri', '<CMD>Telescope lsp_implementations<CR>', { desc = 'LSP [G]oto [I]mplementation' })

    -- Jump to the type of the word under your cursor.
    keymap('n', 'gtd', '<CMD>Telescope lsp_type_definitions<CR>', { desc = 'LSP [G]oto [T]ype [D]efinition' })

    -- Fuzzy find all the symbols in your current document.
    keymap('n', 'gds', '<CMD>Telescope lsp_document_symbols<CR>', { desc = 'LSP [G]oto [D]ocument [S]ymbols' })

    -- Fuzzy find all the symbols in your current workspace.
    keymap('n', 'gws', '<CMD>Telescope lsp_dynamic_workspace_symbols<CR>', { desc = 'LSP [G]oto [W]orkspace [S]ymbols' })

    -- Rename the variable under your cursor.
    keymap('n', 'grn', vim.lsp.buf.rename, { desc = 'LSP [R]e[n]ame' })

    -- Execute a code action.
    keymap('n', 'gra', vim.lsp.buf.code_action, { desc = 'LSP [C]ode [A]ction' })
    keymap('x', 'gra', vim.lsp.buf.code_action, { desc = 'LSP [C]ode [A]ction' })

    -- Restart LSP
    keymap('n', 'grs', function()
      local clients = vim.lsp.get_clients { bufnr = event.buf }

      if #clients > 0 then
        for _, client in ipairs(clients) do
          vim.lsp.stop_client(client.id)
        end
      end

      vim.cmd 'edit'
    end, { desc = 'LSP [R]e[s]tart' })

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    -- local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
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
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      keymap('n', '<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, { desc = '[T]oggle Inlay [H]ints' })
    end
  end,
})
