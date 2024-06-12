require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.keymap.set('n', '<leader>dq', function() dapui.close() end)
vim.keymap.set('n', '<leader>dc', function() dap.continue() end)
vim.keymap.set('n', '<leader>dn', function() dap.step_over() end)
vim.keymap.set('n', '<leader>ds', function() dap.step_into() end)
vim.keymap.set('n', '<leader>do', function() dap.step_out() end)
vim.keymap.set('n', '<leader>dP', function() dap.pause() end)
vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<leader>dl', function() dap.run_last() end)
vim.keymap.set('n', '<leader>dx', function() dap.terminate() end)

dap.adapters.delve = {
    type = 'server',
    port = 2345,
}
dap.configurations.go = {
    {
        type = 'delve',
        request = 'attach',
        name = 'Attach to Go',
        mode = 'remote',
        substitutePath = {
            {
                from = "${env:GOPATH}/src",
                to = "src"
            },
            {
                from = "${env:GOPATH}/bazel-go-code/external/",
                to = "external/"
            },
            {
                from = "${env:GOPATH}/bazel-out/",
                to = "bazel-out/"
            },
            {
                from = "${env:GOPATH}/bazel-go-code/external/go_sdk",
                to = "GOROOT/"
            },
        },
    },
}
