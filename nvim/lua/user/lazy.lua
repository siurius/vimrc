-- lazy.nvim plugin manager setup
-- Bootstrap is handled in init.lua

require("lazy").setup({
  spec = {
    { import = "user.plugins" },
  },
  install = {
    missing = true,
  },
  change_detection = {
    notify = false,
  },
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
