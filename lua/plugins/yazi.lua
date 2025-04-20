return {
  { -- Yazi Nvim: Yazi file explorer inside Neovim
    'mikavilpas/yazi.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    lazy = true,

    event = 'VimEnter',

    cmd = 'Yazi',

    keys = {
      {
        '<leader>=', -- <leader> + =
        '<CMD>Yazi<CR>',
        mode = 'n',
        desc = 'Open yazi at current file directory',
      },
      {
        '<leader>Y',
        '<CMD>Yazi cwd<CR>',
        mode = 'n',
        desc = 'Open yazi at CWD',
      },
    },

    opts = {
      open_for_directories = true,
      floating_window_scaling_factor = 0.75,
      yazi_floating_window_blend = 0,
      keymaps = {
        show_help = 'g?',
        open_file_in_vertical_split = '<leader>|',
        open_file_in_horizontal_split = '<leader>-',
        open_file_in_tab = false,
        grep_in_directory = '<leader>sg',
        replace_in_directory = '<leader>sar',
        cycle_open_buffers = '<tab>',
        copy_relative_path_to_selected_files = 'cr',
        send_to_quickfix_list = '<C-q>',
        change_working_directory = false,
      },
      yazi_floating_window_border = 'rounded',
      clipboard_register = '*', -- check with '+'
      highlight_hovered_buffers_in_same_directory = true,
    },
  },
}
