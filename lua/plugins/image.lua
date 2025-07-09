return {
  { -- Image Nvim: Image support in neovim
    '3rd/image.nvim',

    lazy = true,

    event = 'VimEnter',

    opts = {
      backend = 'kitty',

      processor = 'magick_rock', -- or "magick_cli"

      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
          floating_windows = false, -- if true, images will be rendered in floating markdown windows
          filetypes = { 'markdown', 'vimwiki' }, -- markdown extensions (ie. quarto) can go here
          resolve_image_path = function(document_path, image_path, fallback)
            return fallback(document_path, image_path)
          end,
        },
        html = {
          enabled = false,
        },
        css = {
          enabled = false,
        },
      },

      -- max_width = nil,
      -- max_height = nil,
      -- max_width_window_percentage = nil,
      -- max_height_window_percentage = 50,

      max_width = 100,
      max_height = 12,
      max_width_window_percentage = math.huge,
      max_height_window_percentage = math.huge,

      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped

      window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', 'snacks_notif', 'scrollview', 'scrollview_sign' },

      editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus

      tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)

      hijack_file_patterns = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.webp', '*.avif' }, -- render image files as images when opened
    },
  },

  { -- Luarocks: Luarocks
    'vhyrro/luarocks.nvim',

    lazy = true,

    priority = 1001,

    opts = {
      rocks = { 'magick' },
    },
  },

  { -- Img Clip: Embed images into Neovim
    'HakonHarnes/img-clip.nvim',

    lazy = true,

    opts = {
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = {
          insert_mode = true,
        },
        use_absolute_path = true,
      },
    },
  },
}
