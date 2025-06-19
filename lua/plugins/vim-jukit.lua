return {
  { -- Vim Jukit: Jupyter Notebook kit in Neovim
    'luk400/vim-jukit',

    enabled = false,

    lazy = true,

    event = { 'BufReadPost *.ipynb', 'BufNewFile *.ipynb' },

    init = function()
      -- Basic jukit options

      -- Specifies the command used to start a shell in the output split.
      -- Can also be an absolute path. Can also be any other shell command, e.g. `R`, `julia`, etc.
      -- (Note that output saving is only possible for ipython)
      vim.g.jukit_shell_cmd = 'ipython3'

      -- Terminal to use.
      -- Can be one of '', 'kitty', 'vimterm', 'nvimterm' or 'tmux'.
      -- If '' is given then it will try to detect the terminal (though this might fail, in which case it simply defaults to 'vimterm' or 'nvimterm').
      vim.g.jukit_terminal = ''

      -- If set to 1, will create an autocmd with event `CursorHold` to show saved IPython output of the current cell in the output-history split.
      vim.g.jukit_auto_output_hist = 0

      -- Whether to use the tcomment plugin (https://github.com/tomtom/tcomment_vim) to comment out cell markers.
      -- If not, then cell markers will simply be prepended with `jukit_comment_mark`
      vim.g.jukit_use_tcomment = 0

      -- Cell marker comment prefix.
      vim.g.jukit_comment_mark = '#'

      -- If set to 0, none of the default function mappings (as specified further down) will be applied.
      vim.g.jukit_mappings = 1 -- 1

      -- String or list of strings specifying extensions for which the mappings will be created.
      -- For example, to enable the mappings only in `.py` and `.ipynb` files, use { 'py', 'ipynb' }.
      -- Use '*' to enable them for all files.
      vim.g.jukit_mappings_ext_enabled = { 'py', 'ipynb' } -- '*'

      -- Command to open .ipynb files, by default `jupyter-notebook` is used.
      -- To use e.g. VS Code instead, you could set this to 'code'.
      vim.g.jukit_notebook_viewer = 'jupyter-notebook'

      -- Default setting when converting from .ipynb to .py or vice versa and a file of the same name already exists.
      -- Can be one of [-1, 0, 1], where -1 means no default (i.e. you'll be prompted), 0 means never overwrite, 1 means always overwrite.
      vim.g.jukit_convert_overwrite_default = -1

      -- Default setting for whether the notebook should be opened after converting from .py to .ipynb.
      -- Can be one of [-1, 0, 1], where -1 means no default (i.e. you'll be prompted), 0 means never open, 1 means always open.
      vim.g.jukit_convert_open_default = -1

      -- Default encoding for reading and writing to files in the python helper functions.
      vim.g.jukit_file_encodings = 'utf-8'

      -- Whether to also use the provided terminal command for the output history split when starting the splits using the JukitOUtHist command.
      vim.g.jukit_venv_in_output_hist = 1

      -- Cell highlighting/syntax

      -- Whether to highlight cell markers or not.
      -- You can specify the colors of cell markers by, for example, setting a highlight group like:
      --     highlight jukit_cellmarker_colors guifg=#1d615a guibg=#1d615a ctermbg=22 ctermfg=22
      -- (Make sure to define the highlight after loading a colorscheme)
      vim.g.jukit_highlight_markers = 1

      -- Whether to highlight the background of textcells.
      -- You can specify the color by setting the highlight group 'jukit_textcell_bg_colors'
      -- (Make sure to define this highlight group after loading a colorscheme)
      vim.g.jukit_enable_textcell_bg_hl = 0 -- 1

      -- Whether to enable markdown syntax highlighting in textcells.
      vim.g.jukit_enable_textcell_syntax = 1

      -- Syntax file to use for textcells.
      -- If you want to define your own syntax matches inside of text cells, make sure to include `containedin=textcell`.
      vim.g.jukit_text_syntax_file = os.getenv 'VIMRUNTIME' .. '/syntax/markdown.vim'

      -- String or list of strings specifying extensions for which the relevant highlighting autocmds regarding marker-highlighting, textcell-highlighting, etc. will be created.
      -- For example, to enable highlighting for `.py` and `.R` files, you could use { 'py', 'R' }.
      -- Use '*' to enable them for all files, or '' to disable completely.
      vim.g.jukit_hl_ext_enabled = '*'

      -- Kitty

      -- Optional custom background color of output split window (i.e. target window of sent code).
      vim.g.jukit_output_bg_color = vim.g.jukit_output_bg_color or ''

      -- Optional custom foreground color of output split window.
      vim.g.jukit_output_fg_color = vim.g.jukit_output_fg_color or ''

      -- Optional custom background color of output-history window.
      vim.g.jukit_outhist_bg_color = vim.g.jukit_outhist_bg_color or '#090b1a'

      -- Optional custom foreground color of output-history window.
      vim.g.jukit_outhist_fg_color = vim.g.jukit_outhist_fg_color or 'gray'

      -- If set to 1, opens output split in a new OS window.
      -- This can be used to e.g. write code in one kitty OS window on your primary monitor while sending code to a shell in a separate kitty OS window.
      vim.g.jukit_output_new_os_window = 0

      -- Same as `jukit_output_new_os_window`, only for the output-history split.
      vim.g.jukit_outhist_new_os_window = 0

      -- IPython

      -- Number between 0 and 4.
      -- Defines how the input-code should be represented in the IPython shell.
      -- One of 5 different styles can be chosen, where style 0 is the default IPython style for the `%paste` command.
      vim.g.jukit_in_style = 2

      -- Max size of JSON containing saved output in MiB.
      -- When the output history JSON gets too large, certain jukit operations can get slow.
      vim.g.jukit_max_size = 20

      -- Whether to show (1) or hide (0) the previous IPython prompt after code is sent to the IPython shell.
      vim.g.jukit_show_prompt = 0

      -- Default value for saving IPython output when an IPython shell command is used.
      vim.g.jukit_save_output = 1
      -- Else, if IPython is not used, you might set:
      -- vim.g.jukit_save_output = 0

      -- Frequency in seconds with which to delete saved IPython output (including cached überzug images) of cells that are no longer present.
      vim.g.jukit_clean_outhist_freq = 60 * 60 -- 60 * 10

      -- Matplotlib

      -- Value for the `dpi` argument for matplotlib's `savefig` function.
      vim.g.jukit_savefig_dpi = 150

      -- If set to 0, then `plt.show()` will by default be executed as if `plt.show(block=False)` was specified.
      vim.g.jukit_mpl_block = 1

      -- Custom matplotlib backend to use.
      vim.g.jukit_custom_backend = -1

      -- If kitty is used:
      -- vim.g.jukit_mpl_style = vim.fn['jukit#util#plugin_path']() .. '/helpers/matplotlib-backend-kitty/backend.mplstyle'
      -- Else, if no custom mpl-style is desired, you could set:
      vim.g.jukit_mpl_style = ''

      -- If kitty or tmux is used, enable in-terminal plotting.
      vim.g.jukit_inline_plotting = 1
      -- Else, to disable in-terminal plotting:
      -- vim.g.jukit_inline_plotting = 0

      -- Split layout
      -- You can define a custom split layout as a table. The default is:
      vim.g.jukit_layout = {
        split = 'horizontal',
        p1 = 0.6,
        val = {
          'file_content',
          {
            split = 'vertical',
            p1 = 0.5,
            val = { 'output', 'output_history' },
          },
        },
      }
      -- This results in a layout with the file content on the left, and a vertical split on the right for output and output_history.
      -- To disable any custom layout, set:
      -- vim.g.jukit_layout = -1

      -- Überzug

      -- Set to 1 to use Überzug to display saved outputs instead of an IPython split window.
      vim.g.jukit_hist_use_ueberzug = 0

      -- Whether to cache created images of saved outputs.
      -- If set to 0, images will be converted from scratch each time, which may be slower.
      vim.g.jukit_ueberzug_use_cached = 1

      -- Position and dimension of the Überzug window WITH an output split present.
      -- Format: {x, y, width, height}
      vim.g.jukit_ueberzug_pos = { 0.25, 0.25, 0.4, 0.6 }

      -- Position and dimension of the Überzug window WITHOUT an output split present.
      vim.g.jukit_ueberzug_pos_noout = { 0.25, 0.25, 0.4, 0.6 }

      -- Whether to kill Überzug when Neovim loses focus.
      vim.g.jukit_kill_ueberzug_on_focus_lost = 1

      -- Border color of Überzug images.
      vim.g.jukit_ueberzug_border_color = vim.g.jukit_ueberzug_border_color or 'blue'

      -- Choose dark or light theme for markdown cells.
      vim.g.jukit_ueberzug_theme = 'dark'

      -- This is relevant if the shown Überzug image is cut off horizontally.
      -- A value of -1 means the ratio should be determined automatically.
      vim.g.jukit_ueberzug_term_hw_ratio = -1

      -- Path to the python3 executable for which the Überzug requirements (beautifulsoup4, pillow, ueberzug) are installed.
      vim.g.jukit_ueberzug_python_cmd = 'python3'

      -- Path to the jupyter executable.
      vim.g.jukit_ueberzug_jupyter_cmd = 'jupyter'

      -- Path to the cutycapt executable.
      vim.g.jukit_ueberzug_cutycapt_cmd = 'cutycapt'

      -- Path to the ImageMagick (`convert` command) executable.
      vim.g.jukit_ueberzug_imagemagick_cmd = 'convert'

      -- Visible Cell Seprations
      -- vim.cmd 'highlight jukit_cellmarker_colors guifg=#7aa2f7 guibg=#3b4261 ctermfg=110 ctermbg=237'
      -- vim.cmd 'highlight jukit_cellmarker_colors guifg=#7aa2f7 guibg=#7aa2f7 ctermfg=110 ctermbg=110'
      -- vim.cmd 'highlight jukit_cellmarker_colors guifg=#5f87d7 guibg=#5f87d7 ctermfg=69 ctermbg=69'
      -- vim.cmd 'highlight jukit_cellmarker_colors guifg=#5a83c5 guibg=#5a83c5 ctermfg=68 ctermbg=68'
      vim.cmd 'highlight jukit_cellmarker_colors guifg=#3b4261 guibg=#3b4261 ctermfg=237 ctermbg=237'

      -- Invisible Cell Seprations
      -- vim.cmd 'highlight jukit_cellmarker_colors guifg=#1f2335 guibg=#1f2335 ctermfg=235 ctermbg=235'

      local jukit_leader = ','

      --[[
        Splits
        -- Opens a new output window and executes the command specified in g:jukit_shell_cmd
        -- Opens a new output terminal (without executing any command)
        -- Opens a new output-history window to display saved ipython outputs
        -- Shortcut for opening output terminal and output-history
        -- Close output window
        -- Close output-history window
        -- Close both windows (with prompt)
        -- Show output of the current cell (reloads output if same cell id)
        -- Scroll output-history down/up (argument: 1 for down, 0 for up)
        -- Toggle auto history (creates/deletes autocmd for CursorHold output)
        -- Apply custom layout defined in g:jukit_layout to current splits
      --]]
      vim.keymap.set('n', jukit_leader .. 'os', '<cmd>call jukit#splits#output()<CR>', { desc = 'Open output window and run shell command' })
      vim.keymap.set('n', jukit_leader .. 'ts', '<cmd>call jukit#splits#term()<CR>', { desc = 'Open output terminal (no command)' })
      vim.keymap.set('n', jukit_leader .. 'hs', '<cmd>call jukit#splits#history()<CR>', { desc = 'Open output-history window' })
      vim.keymap.set('n', jukit_leader .. 'ohs', '<cmd>call jukit#splits#output_and_history()<CR>', { desc = 'Open output terminal and history' })
      vim.keymap.set('n', jukit_leader .. 'od', '<cmd>call jukit#splits#close_output_split()<CR>', { desc = 'Close output window' })
      vim.keymap.set('n', jukit_leader .. 'hd', '<cmd>call jukit#splits#close_history()<CR>', { desc = 'Close output-history window' })
      vim.keymap.set('n', jukit_leader .. 'ohd', '<cmd>call jukit#splits#close_output_and_history(1)<CR>', { desc = 'Close both windows (with prompt)' })
      vim.keymap.set('n', jukit_leader .. 'so', '<cmd>call jukit#splits#show_last_cell_output(1)<CR>', { desc = 'Show output of current cell' })
      vim.keymap.set('n', jukit_leader .. 'J', '<cmd>call jukit#splits#out_hist_scroll(1)<CR>', { desc = 'Scroll down in output-history' })
      vim.keymap.set('n', jukit_leader .. 'K', '<cmd>call jukit#splits#out_hist_scroll(0)<CR>', { desc = 'Scroll up in output-history' })
      vim.keymap.set('n', jukit_leader .. 'ah', '<cmd>call jukit#splits#toggle_auto_hist()<CR>', { desc = 'Toggle auto output-history' })
      vim.keymap.set('n', jukit_leader .. 'sl', '<cmd>call jukit#layouts#set_layout()<CR>', { desc = 'Apply custom layout' })

      --[[
        Sending code
        -- Send code within the current cell (argument 0 means do not move the cursor to the next cell)
        -- Send current line to output split
        -- Send visually selected code to output split
        -- Execute all cells until the current cell
        -- Execute all cells
      --]]
      vim.keymap.set('n', jukit_leader .. '<Space>', '<cmd>call jukit#send#section(0)<CR>', { desc = 'Send current cell code' })
      vim.keymap.set('n', jukit_leader .. '<CR>', '<cmd>call jukit#send#line()<CR>', { desc = 'Send current line' })
      vim.keymap.set('v', jukit_leader .. '<CR>', '<cmd><C-U>call jukit#send#selection()<CR>', { desc = 'Send visual selection' })
      vim.keymap.set('n', jukit_leader .. 'cc', '<cmd>call jukit#send#until_current_section()<CR>', { desc = 'Execute cells until current cell' })
      vim.keymap.set('n', jukit_leader .. 'ccc', '<cmd>call jukit#send#all()<CR>', { desc = 'Execute all cells' })

      --[[
        Cells
        -- Create new code cell below (argument 0) or markdown cell (argument 1)
        -- Create new code cell above (argument 0) or markdown cell (argument 1)
        -- Delete current cell
        -- Split current cell (saved output assigned to cell above)
        -- Merge current cell with cell above or below
        -- Move current cell up or down
        -- Jump to next/previous cell
        -- Delete saved output of current cell or all cells
      --]]
      vim.keymap.set('n', jukit_leader .. 'co', '<cmd>call jukit#cells#create_below(0)<CR>', { desc = 'Create code cell below' })
      vim.keymap.set('n', jukit_leader .. 'cO', '<cmd>call jukit#cells#create_above(0)<CR>', { desc = 'Create code cell above' })
      vim.keymap.set('n', jukit_leader .. 'ct', '<cmd>call jukit#cells#create_below(1)<CR>', { desc = 'Create text cell below' })
      vim.keymap.set('n', jukit_leader .. 'cT', '<cmd>call jukit#cells#create_above(1)<CR>', { desc = 'Create text cell above' })
      vim.keymap.set('n', jukit_leader .. 'cd', '<cmd>call jukit#cells#delete()<CR>', { desc = 'Delete current cell' })
      vim.keymap.set('n', jukit_leader .. 'cs', '<cmd>call jukit#cells#split()<CR>', { desc = 'Split current cell' })
      vim.keymap.set('n', jukit_leader .. 'cM', '<cmd>call jukit#cells#merge_above()<CR>', { desc = 'Merge with cell above' })
      vim.keymap.set('n', jukit_leader .. 'cm', '<cmd>call jukit#cells#merge_below()<CR>', { desc = 'Merge with cell below' })
      vim.keymap.set('n', jukit_leader .. 'ck', '<cmd>call jukit#cells#move_up()<CR>', { desc = 'Move cell up' })
      vim.keymap.set('n', jukit_leader .. 'cj', '<cmd>call jukit#cells#move_down()<CR>', { desc = 'Move cell down' })
      vim.keymap.set('n', jukit_leader .. 'j', '<cmd>call jukit#cells#jump_to_next_cell()<CR>', { desc = 'Jump to next cell' })
      vim.keymap.set('n', jukit_leader .. 'k', '<cmd>call jukit#cells#jump_to_previous_cell()<CR>', { desc = 'Jump to previous cell' })
      vim.keymap.set('n', jukit_leader .. 'do', '<cmd>call jukit#cells#delete_outputs(0)<CR>', { desc = 'Delete output of current cell' })
      vim.keymap.set('n', jukit_leader .. 'ddo', '<cmd>call jukit#cells#delete_outputs(1)<CR>', { desc = 'Delete outputs of all cells' })

      --[[
        ipynb Conversion
        -- Convert between ipynb and py files. Optionally open the resulting ipynb with the defined notebook viewer.
        -- Convert file to HTML or PDF (with options to rerun cells and open the result).
      --]]
      vim.keymap.set(
        'n',
        jukit_leader .. 'np',
        "<cmd>call jukit#convert#notebook_convert('jupyter-notebook')<CR>",
        { desc = 'Convert notebook (ipynb <-> py)' }
      )
      vim.keymap.set('n', jukit_leader .. 'ht', "<cmd>call jukit#convert#save_nb_to_file(0,1,'html')<CR>", { desc = 'Convert notebook to HTML' })
      vim.keymap.set('n', jukit_leader .. 'htr', "<cmd>call jukit#convert#save_nb_to_file(1,1,'html')<CR>", { desc = 'Convert & rerun notebook to HTML' })
      vim.keymap.set('n', jukit_leader .. 'pd', "<cmd>call jukit#convert#save_nb_to_file(0,1,'pdf')<CR>", { desc = 'Convert notebook to PDF' })
      vim.keymap.set('n', jukit_leader .. 'pdr', "<cmd>call jukit#convert#save_nb_to_file(1,1,'pdf')<CR>", { desc = 'Convert & rerun notebook to PDF' })

      --[[
        Überzug
        -- Set the default position and dimensions of the Überzug window.
      --]]
      vim.keymap.set('n', jukit_leader .. 'pos', '<cmd>call jukit#ueberzug#set_default_pos()<CR>', { desc = 'Set default Überzug position' })
    end,
  },
}
