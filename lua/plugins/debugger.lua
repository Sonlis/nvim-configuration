return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',

        -- Required dependency for nvim-dap-ui
        'nvim-neotest/nvim-nio',
        -- debug.lua
    },
  config = function()
      local dap = require "dap"
      local ui = require "dapui"
      require("dapui").setup()
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)

      -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true })
      end)

      vim.keymap.set("n", "<leader>c", dap.continue)
      vim.keymap.set("n", "<leader>Si", dap.step_into)
      vim.keymap.set("n", "<leader>SO", dap.step_over)
      vim.keymap.set("n", "<leader>So", dap.step_out)
      vim.keymap.set("n", "<leader>Sb", dap.step_back)
      vim.keymap.set("n", "<leader>r", dap.restart)
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
}
