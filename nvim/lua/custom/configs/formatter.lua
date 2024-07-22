local M = {
  filetype = {
    javascript = {
      require("formatter.filetypes.javascript").prettier
    },
    typescript = {
      require("formatter.filetypes.typescript").prettier
    },
    markdown = {
      require("formatter.filetypes.markdown").prettier,
    },
    css = {
      require("formatter.filetypes.css").prettier,
    },
    html = {
      require("formatter.filetypes.html").prettier,
    },
    json = {
      require("formatter.filetypes.json").prettier,
    },
    javascriptreact = {
      require("formatter.filetypes.javascriptreact").prettier,
    },
    typescriptreact = {
      require("formatter.filetypes.typescriptreact").prettier,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    },
  }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock"
})

return M
