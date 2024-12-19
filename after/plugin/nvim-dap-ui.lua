local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

-- keymaps
vim.keymap.set("n", "<leader>du", function()
    dapui.toggle()
end)

-- events
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
