return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        ["<Leader>G"] =  { desc=" GitHub Copilot" },
        ["<Leader>Ge"] = { "<cmd>Copilot enable<cr>",  desc="Enable Copilot" },
        ["<Leader>Gd"] = { "<cmd>Copilot disable<cr>", desc="Disable Copilot" },
        ["<Leader>Gh"] = { "<cmd>Copilot help<cr>",    desc="Copilot Help Menu" },
        ["<Leader>Ga"] = { "<cmd>Copilot auth<cr>",    desc="Copilot Auth" },
        ["<Leader>Gt"] = { "<cmd>CopilotToggle<cr>",   desc="FloatTerm copilot"  },
        ["<Leader>Gc"] = { "<cmd>CopilotChat<cr>",     desc="Copilot Chat"  },
        ["<Leader>m"] =  { desc="Neominimap" },
        ["<Leader>me"] = { "<cmd>Neominimap Enable<cr>",    desc="Enable minimap" },
        ["<Leader>md"] = { "<cmd>Neominimap Disable<cr>",   desc="Disable minimap" },
        ["<Leader>mt"] = { "<cmd>Neominimap BufToggle<cr>", desc="Toggle minimap" },
      },
      t = {
        -- setting a mapping to false will disable it
      },
      v = {
        ["<Leader>H"] = { desc="Header Formatting" },
        ["<Leader>Hs"] = {
          "<cmd>MkHdr -Us single<cr>",
          desc = "Format inline header from selection",
        },
        ["<Leader>Hm"] = {
          "<cmd>MkHdr -Us multi<cr>",
          desc = "Format multi-line header from selection",
        },
      },
    },
  },
}
