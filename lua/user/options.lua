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
