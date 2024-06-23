local options = {
  ensure_installed = {
    "lua",
    "tsx",
    "javascript",
    "typescript",
    "css",
    "html",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
  additional_vim_regex_highlighting = false,

  require('ts_context_commentstring').setup {
    enable_autocmd = false,
    languages = {
      typescript = '// %s',
    },
  }

}

return options
