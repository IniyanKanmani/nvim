return {
  { -- Copilot Lua: Get Github Copilot in Neovim
    'zbirenbaum/copilot.lua',

    lazy = true,

    opts = {
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
    },
  },
}
