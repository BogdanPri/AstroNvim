if vim.fn.has("win32") == 1 then
  -- On Windows
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -Command"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
else
  -- On Linux/macOS (or anything else)
  vim.opt.shell = "/usr/bin/fish"  -- or the output of `which fish`
end
