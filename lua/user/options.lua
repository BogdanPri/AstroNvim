if vim.fn.has("win32") == 1 then
  -- On Windows
  if vim.fn.executable("pwsh") == 1 then
    vim.opt.shell = "pwsh"
  else
    vim.opt.shell = "powershell"
  end

  vim.opt.shellcmdflag = "-NoLogo -NoProfile -Command"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""

else
  -- On Linux/macOS (or anything else)
  if vim.fn.executable("/usr/bin/fish") == 1 then
    vim.opt.shell = "/usr/bin/fish"  -- or the output of `which fish`
  else
    vim.opt.shell = "/usr/bin/bash"
  end
end

-- Set neominimap to be disabled by default
vim.g.neominimap_enabled = false

-- Copilot starts disabled by default
vim.g.copilot_enabled = false

-- Set `Ctrl+l` to accept Copilot suggestion
vim.keymap.set('i', '<C-L>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

vim.cmd([[
  autocmd FileType lsl setlocal commentstring=//\ %s
]])
