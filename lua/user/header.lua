------------------------------------------------------------------------------------
-- MAP FILETYPES TO COMMENT CHARACTERS                                              
------------------------------------------------------------------------------------

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
  kerboscript = "//",
}

------------------------------------------------------------------------------------
-- CORE RUNNER (CALLS EXTERNAL HFMT)                                                
------------------------------------------------------------------------------------

local function run_hfmt(args)
  -- detect filetype and get comment char
  local ft = vim.bo.filetype or "txt"
  local char = comment_chars[ft] or "#"

  -- check if --char is already in args
  local has_char = false
  for _, a in ipairs(args) do
    if a:match("^%-%-char") then
      has_char = true
      break
    end
  end

  -- prepend default --char if missing
  if char and not has_char then
    table.insert(args, 1, "--char=" .. char)
  end

  local result = vim.fn.system({ "hfmt", unpack(args) })
  return vim.split(result, "\n", { plain = true })
end

------------------------------------------------------------------------------------
-- GET VISUAL SELECTION SAFELY                                                      
------------------------------------------------------------------------------------

local function get_visual_selection()
  -- get the start/end rows & columsn
  local srow, scol = unpack(vim.api.nvim_buf_get_mark(0, "<"))
  local erow, ecol = unpack(vim.api.nvim_buf_get_mark(0, ">"))

  -- normalise order
  if srow > erow or (srow == erow and scol > ecol) then
    srow, erow = erow, srow
    scol, ecol = ecol, scol
  end

  -- extract selected lines
  local lines = vim.api.nvim_buf_get_lines(0, srow - 1, erow, false)

  -- trim partial selection edges
  lines[1] = string.sub(lines[1], scol + 1)
  lines[#lines] = string.sub(lines[#lines], 1, ecol)

  return lines, srow, erow
end

------------------------------------------------------------------------------------
-- :HFMT -> INSERT OUTPUT AT CURSOR                                                 
------------------------------------------------------------------------------------

vim.api.nvim_create_user_command("Hfmt", function(opts)
  -- build shell command
  -- local args = table.concat(opts.fargs, " ")
  local args = vim.list_extend({ text }, opts.fargs)
  -- local cmd = "hfmt " .. args

  -- run and capture output
  -- local output = vim.fn.system(cmd)
  -- local lines = vim.split(output, "\n", { plain = true })
  local lines = run_hfmt(args)

  -- insert result at cursor
  vim.api.nvim_put(lines, "l", true, true)
end, {
    nargs = "*", -- allow any number of args
    complete = "file",
})

------------------------------------------------------------------------------------
-- :MKHDR -> REPLACES VISUAL SELECTION WITH HEADER                                  
------------------------------------------------------------------------------------

vim.api.nvim_create_user_command("MkHdr", function(opts)
  -- extract visual selection
  local sel_lines, srow, erow = get_visual_selection()

  -- build args for hfmt
  local text = table.concat(sel_lines, " ")
  local args = vim.list_extend({ text }, opts.fargs)

  -- run hfmt and get formatted header
  local formatted = run_hfmt(args)

  -- replace original selection with formatted header
  vim.api.nvim_buf_set_lines(0, srow - 1, erow, false, formatted)
end, {
    nargs = "*",
    range = true,
})

------------------------------------------------------------------------------------
-- END                                                                              
------------------------------------------------------------------------------------
