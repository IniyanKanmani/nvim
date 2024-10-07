return {
  { -- Goto Preview: View LSP stuff in a floating window
    'rmagatti/goto-preview',

    lazy = true,

    event = 'BufReadPre',

    opts = {
      default_mappings = true,
    },
  },
}
