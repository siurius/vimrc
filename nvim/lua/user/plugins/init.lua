-- Plugin specifications for lazy.nvim
-- Author: Yiran Li <yiranli91@gmail.com>

return {
  -----------------------------------------------------------------------------
  -- FILE EXPLORER (replaces NERDTree)
  -----------------------------------------------------------------------------
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFindFile" },
    keys = {
      { "<F2>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
    },
    opts = {
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = false,
            folder = false,
            folder_arrow = true,
            git = false,
          },
          glyphs = {
            folder = {
              arrow_closed = ">",
              arrow_open = "v",
            },
          },
        },
      },
      filters = { dotfiles = false },
    },
  },

  -----------------------------------------------------------------------------
  -----------------------------------------------------------------------------
  -- FUZZY FINDER (replaces fzf.vim)
  -----------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Find files" },
      { "<leader>/", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
      { "<leader>b", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<leader>of", "<cmd>Telescope oldfiles<CR>", desc = "Old files" },
      { "<leader>os", "<cmd>Telescope search_history<CR>", desc = "Search history" },
      { "<leader>oc", "<cmd>Telescope command_history<CR>", desc = "Command history" },
      { "<leader>H", "<cmd>Telescope help_tags<CR>", desc = "Help tags" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          preview = {
            treesitter = false,
          },
        },
      })
    end,
  },

  -- Telescope fzf extension
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },

  -- STATUSLINE (replaces vim-airline)
  -----------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local colors = {
        bg = "#1a1a1a",
        fg = "#f8f8f2",
        red = "#f92672",
        green = "#a6e22e",
        yellow = "#e6db74",
        blue = "#66d9ef",
        purple = "#ae81ff",
        orange = "#fd971f",
        gray = "#75715e",
      }

      local molokai = {
        normal = {
          a = { fg = colors.bg, bg = colors.green, gui = "bold" },
          b = { fg = colors.fg, bg = colors.gray },
          c = { fg = colors.fg, bg = colors.bg },
        },
        insert = {
          a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
          b = { fg = colors.fg, bg = colors.gray },
          c = { fg = colors.fg, bg = colors.bg },
        },
        visual = {
          a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
          b = { fg = colors.fg, bg = colors.gray },
          c = { fg = colors.fg, bg = colors.bg },
        },
        replace = {
          a = { fg = colors.bg, bg = colors.red, gui = "bold" },
          b = { fg = colors.fg, bg = colors.gray },
          c = { fg = colors.fg, bg = colors.bg },
        },
        command = {
          a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
          b = { fg = colors.fg, bg = colors.gray },
          c = { fg = colors.fg, bg = colors.bg },
        },
        inactive = {
          a = { fg = colors.gray, bg = colors.bg, gui = "bold" },
          b = { fg = colors.gray, bg = colors.bg },
          c = { fg = colors.gray, bg = colors.bg },
        },
      }

      require("lualine").setup({
        options = {
          icons_enabled = false,
          theme = molokai,
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { statusline = { "NvimTree" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
  -----------------------------------------------------------------------------
  -- GIT
  -----------------------------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "^" },
        changedelete = { text = "~" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 300,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    },
    keys = {
      -- Navigation
      { "]h", function() require("gitsigns").nav_hunk("next") end, desc = "Next hunk" },
      { "[h", function() require("gitsigns").nav_hunk("prev") end, desc = "Prev hunk" },
      -- Actions
      { "<leader>gs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk", mode = { "n", "v" } },
      { "<leader>gr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk", mode = { "n", "v" } },
      { "<leader>gS", function() require("gitsigns").stage_buffer() end, desc = "Stage buffer" },
      { "<leader>gR", function() require("gitsigns").reset_buffer() end, desc = "Reset buffer" },
      { "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo stage hunk" },
      { "<leader>gp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
      { "<leader>gb", function() require("gitsigns").blame_line({ full = true }) end, desc = "Blame line" },
      { "<leader>gB", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle line blame" },
      { "<leader>gd", function() require("gitsigns").diffthis() end, desc = "Diff this" },
      { "<leader>gD", function() require("gitsigns").diffthis("~") end, desc = "Diff this ~" },
      { "<leader>gx", function() require("gitsigns").toggle_deleted() end, desc = "Toggle deleted" },
      -- Text object
      { "ih", ":<C-U>Gitsigns select_hunk<CR>", desc = "Select hunk", mode = { "o", "x" } },
    },
  },

  -- Diff viewer
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    keys = {
      { "<leader>gvo", "<cmd>DiffviewOpen<CR>", desc = "Diffview open" },
      { "<leader>gvc", "<cmd>DiffviewClose<CR>", desc = "Diffview close" },
      { "<leader>gvh", "<cmd>DiffviewFileHistory<CR>", desc = "Diffview file history" },
      { "<leader>gvH", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview current file history" },
    },
    opts = {
      view = {
        default = {
          layout = "diff2_horizontal",
        },
      },
    },
  },

  -- LSP & COMPLETION (replaces coc.nvim)
  -----------------------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
    build = ":MasonUpdate",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "clangd",
        "rust_analyzer",
        -- "gopls",
        "pyright",
        "ts_ls",
        "jdtls",
        -- "hls",
        "lua_ls",
      },
      automatic_installation = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP keybindings
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })

      -- Configure servers
      local servers = {
        clangd = { filetypes = { "c", "cpp", "objc", "objcpp" } },
        rust_analyzer = { filetypes = { "rust" } },
        -- gopls = { filetypes = { "go", "gomod", "gowork", "gotmpl" } },
        pyright = { filetypes = { "python" } },
        ts_ls = { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
        jdtls = { filetypes = { "java" } },
        -- hls = { filetypes = { "haskell", "lhaskell" } },
        lua_ls = {
          filetypes = { "lua" },
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { library = { vim.env.VIMRUNTIME } },
            },
          },
        },
      }

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        vim.lsp.config[server] = config
        vim.lsp.enable(server)
      end
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
    dependencies = { "L3MON4D3/LuaSnip" },
  },

  -----------------------------------------------------------------------------
  -- SYNTAX (Treesitter)
  -----------------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "bash", "c", "cpp", "go", "haskell", "java", "javascript",
          "json", "lua", "markdown", "python", "rust", "typescript", "vim", "yaml",
        },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -----------------------------------------------------------------------------
  -- COLORSCHEME
  -----------------------------------------------------------------------------
  {
    "tomasr/molokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme molokai]])
    end,
  },

  -----------------------------------------------------------------------------
  -- UI
  -----------------------------------------------------------------------------
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "classic",
      icons = {
        mappings = false,
        rules = false,
        group = "+",
        separator = " >",
        keys = {
          C = "C-",
          M = "M-",
          D = "D-",
          S = "S-",
          CR = "Enter",
          Esc = "Esc",
        },
      },
      delay = 200,
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps",
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        { "<leader>f", group = "find" },
        { "<leader>o", group = "old/recent" },
        { "<leader>g", group = "git" },
        { "<leader>c", group = "code" },
        { "<leader>r", group = "run/toggle" },
        { "<leader>e", group = "enable-disable" },
        { "<leader>a", group = "AI" },
      })
    end,
  },

  -- Rainbow parentheses
  {
    "luochen1990/rainbow",
    event = "VeryLazy",
    init = function()
      vim.g.rainbow_active = 1
    end,
  },

  -----------------------------------------------------------------------------
  -- EDITING
  -----------------------------------------------------------------------------
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },

  -- Motion
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = { modes = { char = { enabled = false } } },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
    },
  },

  -- Multiple cursors
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-m>",
        ["Find Subword Under"] = "<C-m>",
      }
    end,
  },

  -- Marks
  {
    "kshenoy/vim-signature",
    event = "VeryLazy",
  },

  -- Alignment
  {
    "godlygeek/tabular",
    cmd = "Tabularize",
  },

  -- Markdown
  {
    "preservim/vim-markdown",
    ft = "markdown",
    dependencies = { "godlygeek/tabular" },
    init = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_conceal = 0
    end,
  },

  -----------------------------------------------------------------------------
  -- CODING TOOLS
  -----------------------------------------------------------------------------
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
    keys = {
      { "<leader>rc", "<cmd>Codi!!<CR>", desc = "Toggle Codi scratchpad" },
    },
  },

  {
    "jpalardy/vim-slime",
    event = "VeryLazy",
    keys = {
      { "<leader>rs", "<cmd>SlimeConfig<CR>", desc = "Slime config" },
    },
    init = function()
      vim.g.slime_target = "tmux"
      vim.g.slime_python_ipython = 1
    end,
  },

  {
    "pechorin/any-jump.vim",
    cmd = { "AnyJump", "AnyJumpBack", "AnyJumpArg" },
    keys = {
      { "<leader>j", "<cmd>AnyJump<CR>", desc = "Any jump" },
    },
  },

  -----------------------------------------------------------------------------
  -- TAGBAR
  -----------------------------------------------------------------------------
  {
    "preservim/tagbar",
    cmd = "TagbarToggle",
    keys = {
      { "<F3>", "<cmd>TagbarToggle<CR>", desc = "Toggle tagbar" },
    },
  },

  -----------------------------------------------------------------------------
  -- AI (Code Companion with ACP)
  -----------------------------------------------------------------------------
  {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = {
      "CodeCompanion",
      "CodeCompanionChat",
      "CodeCompanionActions",
      "CodeCompanionCmd",
    },
    keys = {
      -- Action Palette
      { "<leader>aa", "<cmd>CodeCompanionActions<CR>", desc = "AI Action Palette", mode = { "n", "v" } },
      -- Chat
      { "<leader>ac", "<cmd>CodeCompanionChat<CR>", desc = "AI Chat" },
      -- Inline Assistant (works with visual selection)
      { "<leader>ai", "<cmd>CodeCompanion<CR>", desc = "AI Inline Assistant", mode = { "n", "v" } },
      -- Toggle chat
      { "<leader>at", "<cmd>CodeCompanionChat toggle<CR>", desc = "AI Toggle Chat" },
    },
    config = function()
      -- Load .env file (recursive upward search like python-dotenv)
      local function load_dotenv()
        local current = vim.fn.getcwd()
        while current ~= "/" do
          local env_file = current .. "/.env"
          if vim.fn.filereadable(env_file) == 1 then
            for line in io.lines(env_file) do
              local key, value = line:match("^([%w_]+)=(.+)$")
              if key and value then
                value = value:match("^['\"]?(.-)['\"]?$") or value
                vim.env[key] = value
              end
            end
            return true
          end
          current = vim.fn.fnamemodify(current, ":h")
        end
        return false
      end
      load_dotenv()

      require("codecompanion").setup({
        adapters = {
          http = {
            my_openai = function()
              return require("codecompanion.adapters").extend("openai", {
                name = "my_openai",
                formatted_name = "Custom OpenAI",
                url = (vim.env.OPENAI_BASE_URL or "") .. "/chat/completions",
                env = {
                  api_key = "OPENAI_API_KEY",
                },
                schema = {
                  model = {
                    default = vim.env.OPENAI_MODEL or "gpt-4o",
                  },
                },
              })
            end,
          },
          acp = {
            -- Grok CLI over ACP (same login as `grok` / ~/.grok/auth.json)
            grok = function()
              return {
                name = "grok",
                formatted_name = "Grok",
                type = "acp",
                roles = {
                  llm = "assistant",
                  user = "user",
                },
                commands = {
                  default = {
                    vim.fn.expand("~/.grok/bin/grok"),
                    "agent",
                    "stdio",
                  },
                },
                defaults = {
                  mcpServers = {},
                  timeout = 60000,
                },
                parameters = {
                  protocolVersion = 1,
                  clientCapabilities = {
                    fs = { readTextFile = true, writeTextFile = true },
                  },
                  clientInfo = {
                    name = "CodeCompanion.nvim",
                    version = "1.0.0",
                  },
                },
                handlers = {
                  setup = function()
                    return true
                  end,
                  auth = function()
                    return true
                  end,
                  form_messages = function(self, messages, capabilities)
                    return require("codecompanion.adapters.acp.helpers").form_messages(self, messages, capabilities)
                  end,
                },
              }
            end,
            -- OpenCode: Built-in ACP adapter
            opencode = function()
              return require("codecompanion.adapters").extend("acp", {
                name = "opencode",
                formatted_name = "OpenCode",
                commands = {
                  default = { "opencode", "acp" },
                },
                defaults = {
                  timeout = 60000,  -- 60 seconds for longer operations
                },
              })
            end,
            -- OpenHands: Custom ACP adapter (not built-in)
            openhands = function()
              return {
                name = "openhands",
                formatted_name = "OpenHands",
                type = "acp",
                commands = {
                  default = { "uvx", "--python", "3.12", "openhands", "acp" },
                },
                defaults = {
                  timeout = 60000,  -- 60 seconds for longer operations
                },
              }
            end,
          },
        },
        interactions = {
          chat = { adapter = "grok" },
          inline = { adapter = "my_openai" },
        },
        display = {
          chat = {
            window = {
              position = "right",  -- left|right|top|bottom
            },
          },
        },
        opts = {
          log_level = "INFO",  -- Set to "DEBUG" for troubleshooting
        },
      })
    end,
  },
}
