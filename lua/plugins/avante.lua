return {
  { -- Avante Nvim: Cursor like Agent mode in Neovim
    'yetone/avante.nvim',

    version = false, -- Never set this value to "*"! Never!

    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
      'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
      'stevearc/dressing.nvim', -- for input provider dressing
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      'HakonHarnes/img-clip.nvim',
      'MeanderingProgrammer/render-markdown.nvim',
    },

    lazy = true,

    event = 'VeryLazy',

    build = function()
      if vim.fn.has 'win32' == 1 then
        return 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false'
      else
        return 'make'
      end
    end,

    opts = {
      provider = 'copilot',
      auto_suggestions_provider = nil,
      memory_summary_provider = nil,
      -- system_prompt = nil,

      providers = {
        copilot = {
          model = 'gpt-4.1',
          allow_insecure = false,
          timeout = 300000,
          context_window = 128000,
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 128000,
          },
        },

        ['copilot-gpt-o1'] = {
          __inherited_from = 'copilot',
          model = 'o1',
        },

        ['copilot-claude-3.7-sonnet-thinking'] = {
          __inherited_from = 'copilot',
          model = 'claude-3.7-sonnet-thought',
        },
      },

      dual_boost = {
        enabled = false,
        first_provider = 'copilot-gpt-o1',
        second_provider = 'copilot-claude-3.7-sonnet-thinking',
        -- prompt = '',
        timeout = 300000,
      },

      web_search_engine = {
        -- provider = 'searxng',
        provider = 'brave', -- 2000 free requests per month @ 1 request per second
        -- provider = 'tavily', -- 1000 free requests per month
      },

      behaviour = {
        auto_focus_sidebar = true,
        auto_suggestions = false, -- Experimental stage
        auto_suggestions_respect_ignore = true,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        jump_result_buffer_on_finish = false,
        support_paste_from_clipboard = false,
        minimize_diff = true,
        enable_token_counting = true,
        use_cwd_as_project_root = true,
        auto_focus_on_diff_view = false,
        auto_approve_tool_permissions = false,
        auto_check_diagnostics = true,
      },

      prompt_logger = { -- logs prompts to disk (timestamped, for replay/debugging)
        enabled = true, -- toggle logging entirely
      },

      mappings = {
        toggle = {
          hint = '<leader>ahi',
        },
        confirm = {
          focus_window = '<M-f>',
        },
      },

      windows = {
        input = {
          height = 10, -- Height of the input window in vertical layout
        },
        ask = {
          start_insert = false,
        },
      },

      file_selector = {
        provider = 'native',
      },

      selector = {
        provider = 'telescope',
      },

      input = {
        provider = 'native',
      },

      -- -- Extra: RAG service
      -- rag_service = { -- RAG service configuration
      --   enabled = false, -- Enables the RAG service
      --   host_mount = os.getenv 'HOME' .. '/workspace/', -- Host mount path for the RAG service (Docker will mount this path)
      --   runner = 'docker', -- The runner for the RAG service (can use docker or nix)
      --   llm = { -- Configuration for the Language Model (LLM) used by the RAG service
      --     -- provider = 'openai', -- The LLM provider
      --     -- endpoint = 'https://api.openai.com/v1', -- The LLM API endpoint
      --     -- api_key = 'OPENAI_API_KEY', -- The environment variable name for the LLM API key
      --     -- model = 'gpt-4o-mini', -- The LLM model name
      --     -- extra = nil, -- Extra configuration options for the LLM
      --   },
      --   embed = { -- Configuration for the Embedding model used by the RAG service
      --     -- provider = 'openai', -- The embedding provider
      --     -- endpoint = 'https://api.openai.com/v1', -- The embedding API endpoint
      --     -- api_key = 'OPENAI_API_KEY', -- The environment variable name for the embedding API key
      --     -- model = 'text-embedding-3-large', -- The embedding model name
      --     -- extra = nil, -- Extra configuration options for the embedding model
      --   },
      --   docker_extra_args = '', -- Extra arguments to pass to the docker command
      -- },
    },
  },
}
