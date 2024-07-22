return {
  "mfussenegger/nvim-dap",
  depenencies = {
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dapui").setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.isteners.before.event_exited.dapui_config = function()
      dapui.open()
    end

    vim.keymap.set("n", "<leader>ta", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<leader>td", dap.step_out, {})
    vim.keymap.set("n", "<leader>th", dap.step_into, {})
    vim.keymap.set("n", "<leader>tj", dap.step_over, {})
    vim.keymap.set("n", "<leader>tk", dap.continue, {})
    vim.keymap.set("n", "<leader>tl", dap.run_last, {})
  end,
}
