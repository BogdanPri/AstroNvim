-- Import the Terminal class from toggleterm
local Terminal = require("toggleterm.terminal").Terminal

-- Create a new Terminal instance for Copilot
local copilot = Terminal:new({
  cmd = "copilot",
  hidden = true,
  direction = "float",
})

-- Function to toggle the Copilot terminal
function _G.toggle_copilot()
  copilot:toggle()
end

-- Create a command to invoke the toggle function
vim.api.nvim_command("command! CopilotToggle lua toggle_copilot()")
