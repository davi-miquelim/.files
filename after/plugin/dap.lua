require("dapui").setup()

local dap = require("dap")
local ui = require("dapui")

require("dap-vscode-js").setup({
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})

for _, language in ipairs({"typescript", "javascript"}) do
    require("dap").configurations[language] = {
         {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
        }
    }
end

vim.keymap.set("n", "<leader>b" dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>gb" dap.run_to_cursor)

vim.keymap.set("n", "<leader>?" function()
    require("dapui").eval(nil, {enter = true})
end)


vim.keymap.set("n", "<leader>dc" dap.continue)
vim.keymap.set("n", "<leader>di" dap.step_into)
vim.keymap.set("n", "<leader>dsr" dap.step_over)
vim.keymap.set("n", "<leader>dst" dap.step_out)
vim.keymap.set("n", "<leader>dsb" dap.step_back)
vim.keymap.set("n", "<leader>dr" dap.restart)

dap.listeners.before.attach.dapui_config = function()
    ui.open()
end

dap.listeners.before.launch.dapui_config = function()
    ui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
end
