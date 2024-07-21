local dap = require("dap")

local js_based_languages = require("custom.variables").dap_js_based_languages

for _, language in ipairs(js_based_languages) do
  dap.configurations[language] = {
    -- Debug single nodejs files
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      sourceMaps = true,
    },
    -- Debug node js processes (make sure to add --inspect when you run the process)
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
      sourceMaps = true,
    },
    -- Debug web applications (client side) - launch new browser
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch and Debug Chrome",
      url = function()
        local co = coroutine.running()
        return coroutine.create(function()
          vim.ui.input({
            prompt = "Enter URL: ",
            default = "http://localhost:3000",
          }, function(url)
            if url == nil or url == "" then
              return
            else
              coroutine.resume(co, url)
            end
          end)
        end)
      end,
      -- webRoot = vim.fn.getcwd(),
      webRoot = "${workspaceFolder}",
      skipFiles = { "<node_internals>/**/*.js" },
      protocol = "inspector",
      sourceMaps = true,
      userDataDir = vim.fn.expand("~/.config/chromium/Default"),
      useDataDir = false,
      port = 9222,
    },
    -- {
    --   type = "pwa-chrome",
    --   request = "attach",
    --   name = "Attach and Debug Chrome",
    --   url = function()
    --     local co = coroutine.running()
    --     return coroutine.create(function()
    --       vim.ui.input({
    --         prompt = "Enter URL: ",
    --         default = "http://localhost:3000",
    --       }, function(url)
    --         if url == nil or url == "" then
    --           return
    --         else
    --           coroutine.resume(co, url)
    --         end
    --       end)
    --     end)
    --   end,
    --   webRoot = "${workspaceFolder}",
    --   skipFiles = { "<node_internals>/**/*.js" },
    --   protocol = "inspector",
    --   sourceMaps = true,
    --   port = 9222,
    -- },
    {
      type = 'pwa-chrome',
      request = 'attach',
      name = 'Attach Program (pwa-chrome = { port: 9222 })',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      port = 9222,
      webRoot = '${workspaceFolder}',
    },
    -- Divider for the launch.json derived configs
    {
      name = "----- ↓ launch.json configs ↓ -----",
      type = "",
      request = "launch",
    },
    -- add the logic here ot load config. I think I accidentally removed this
  }
end
