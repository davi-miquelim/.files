return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require("dap")
            vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)
            vim.keymap.set("n", "<F1>", dap.continue)
            vim.keymap.set("n", "<F2>", dap.step_into)
            vim.keymap.set("n", "<F3>", dap.step_over)
            vim.keymap.set("n", "<F4>", dap.step_out)
            vim.keymap.set("n", "<F5>", dap.step_back)
            vim.keymap.set("n", "<F6>", dap.restart)
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            local dap = require("dap")
            local ui = require("dapui")
            vim.keymap.set("n", "<leader>?", function()
                require("dapui").eval(nil, {enter = true})
            end)
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
        end
    },
    {'leoluz/nvim-dap-go'},
    {'theHamsta/nvim-dap-virtual-text'},
}

