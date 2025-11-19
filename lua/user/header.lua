function format_header_from_selection(args)
  -- Map filetypes to comment characters
  local comment_chars = {
    python = "#",
    lua = "--",
    vim = '"',
    tex = "%",
    plaintex = "%",
    matlab = "%",
    c = "//",
    cpp = "//",
    lsl = "//",
  }

  -- Get current filetype 
  local ft = vim.bo.filetype
  local char = comment_chars[ft] or "#"

  -- Get visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  local header = table.concat(lines, " ")

  -- Build and run command
  local cmd = string.format('header -H "%s" -c "%s" %s', header, char, args or "")
  local output = vim.fn.system(cmd)

  -- Replace selection with formatted header
  vim.fn.setline(start_pos[2], vim.split(output, "\n"))

  -- Exit visual mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
end

vim.api.nvim_create_user_command("HeaderFormat", function(opts)
  format_header_from_selection(opts.args)
end, {
  nargs = "*",
  range = true,
})
