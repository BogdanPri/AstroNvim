-- lua/plugins/nvim-autopairs.lua
local Rule = require("nvim-autopairs.rule")

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({})

      npairs.add_rules({
        Rule("$", "$", { "typst", "tex", "latex" })
          :with_move(function(opts)
            return opts.prev_char:match(".%$") ~= nil
          end)
          :with_pair(function(opts)
            return opts.line:sub(opts.col - 1, opts.col - 1) ~= "\\"
          end)
          :with_del(function(opts)
            return opts.prev_char:match(".%$") ~= nil
          end),
      })
    end,
  },
}
