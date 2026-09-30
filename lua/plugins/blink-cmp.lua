return { -- Autocompletion
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    'MahanRahmati/blink-nerdfont.nvim',
    'moyiz/blink-emoji.nvim',
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        -- Build Step is needed for regex support in snippets.
        -- This step is not supported in many windows environments.
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        -- `friendly-snippets` contains a variety of premade snippets.
        --    See the README about individual language/framework/plugin snippets:
        --    https://github.com/rafamadriz/friendly-snippets
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
      opts = {},
    },
    'folke/lazydev.nvim',
  },
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    keymap = {
      -- 'default' (recommended) for mappings similar to built-in completions
      --   <c-y> to accept ([y]es) the completion.
      --    This will auto-import if your LSP supports it.
      --    This will expand snippets if the LSP sent a snippet.
      -- 'super-tab' for tab to accept
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- <tab>/<s-tab>: move to right/left of your snippet expansion
      -- <c-space>: Open menu or open docs if already open
      -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
      -- <c-e>: Hide menu
      -- <c-k>: Toggle signature help
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      preset = 'default',
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
      kind_icons = {
        Text = '󰉿',
        Method = '󰊕',
        Function = '󰊕',
        Constructor = '󰒓',

        Field = '󰜢',
        Variable = '󰆦',
        Property = '󰖷',

        Class = '󱡠',
        Interface = '󱡠',
        Struct = '󱡠',
        Module = '󰅩',

        Unit = '󰪚',
        Value = '󰦨',
        Enum = '󰦨',
        EnumMember = '󰦨',

        Keyword = '󰻾',
        Constant = '󰏿',

        Snippet = '󱄽',
        Color = '󰏘',
        File = '󰈔',
        Reference = '󰬲',
        Folder = '󰉋',
        Event = '󱐋',
        Operator = '󰪚',
        TypeParameter = '󰬛',
      },
    },

    completion = {
      -- By default, you may press `<c-space>` to show the documentation.
      -- Optionally, set `auto_show = true` to show the documentation after a delay.
      documentation = { auto_show = false, auto_show_delay_ms = 10 },
      ghost_text = { enabled = true },
      list = {
        selection = {
          preselect = false,
        },
      },
      menu = {
        draw = {
          columns = {
            { 'kind_icon', 'label', 'label_description', gap = 1 },
            { 'kind', 'source_name', gap = 1 },
          },
          components = {
            label_description = {
              width = { max = 50 },
            },
            source_name = {
              text = function(ctx)
                return '[' .. ctx.source_name .. ']'
              end,
            },
          },
        },
      },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer', 'nerdfont', 'emoji' },
      per_filetype = {
        sql = { 'dadbod', 'snippets', 'buffer' },
        mysql = { 'dadbod', 'snippets', 'buffer' },
        plsql = { 'dadbod', 'snippets', 'buffer' },
      },
      providers = {
        snippets = {
          score_offset = 30,
        },
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 50,
        },
        nerdfont = {
          module = 'blink-nerdfont',
          name = 'Nerd Fonts',
          opts = { insert = true },
        },
        emoji = {
          module = 'blink-emoji',
          name = 'Emoji',
          opts = { insert = true },
          should_show_items = function()
            return vim.tbl_contains({ 'gitcommit', 'markdown' }, vim.o.filetype)
          end,
        },
        dadbod = {
          name = 'Dadbod',
          module = 'vim_dadbod_completion.blink',
        },
      },
      transform_items = function(_, items)
        return vim.tbl_filter(function(item)
          return not (item.kind == require('blink.cmp.types').CompletionItemKind.Snippet and item.source_name == 'LSP')
        end, items)
      end,
    },

    snippets = { preset = 'luasnip' },

    -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
    -- which automatically downloads a prebuilt binary when enabled.
    --
    -- By default, we use the Lua implementation instead, but you may enable
    -- the rust implementation via `'prefer_rust_with_warning'`
    --
    -- See :h blink-cmp-config-fuzzy for more information
    fuzzy = { implementation = 'lua' },

    -- Shows a signature help window while you type arguments for a function
    signature = { enabled = true },
  },
}
