return {
  'yetone/avante.nvim',
  -- dir = '~/Documents/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!

  opts = {
    mode = 'agentic',
    provider = 'copilot',
    providers = {
      copilot = {
        endpoint = 'https://api.githubcopilot.com',
        model = 'gpt-5',
        allow_insecure = false,
        timeout = 30000,
        extra_request_body = {
          temperature = 0,
          max_tokens = 20480,
        },
      },
    },
    disabled_tools = {
      'list_files',
      'search_files',
      'read_file',
      'create_file',
      'rename_file',
      'delete_file',
      'create_dir',
      'rename_dir',
      'delete_dir',
      'bash',
    },
    model_override = {
      {
        name = 'gpt-4.1-mini',
        provider_name = 'openai',
        model = 'openai/gpt-4.1-mini',
      },
      {
        name = 'gpt-4.1-nano',
        provider_name = 'openai',
        model = 'openai/gpt-4.1-mini',
      },
      {
        name = 'Mistral 3',
        provider_name = 'openai',
        model = 'mistralai/mistral-medium-3',
      },
    },

    -- other config
    -- The system_prompt type supports both a string and a function that returns a string. Using a function here allows dynamically updating the prompt with mcphub
    system_prompt = function()
      local hub = require('mcphub').get_hub_instance()
      if not hub then
        return 'Avante'
      end
      return hub:get_active_servers_prompt()
    end,
    -- The custom_tools type supports both a list and a function that returns a list. Using a function here prevents requiring mcphub before it's loaded
    custom_tools = function()
      return {
        require('mcphub.extensions.avante').mcp_tool(),
      }
    end,
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'echasnovski/mini.pick', -- for file_selector provider mini.pick
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
