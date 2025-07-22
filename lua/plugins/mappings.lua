return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        ["<Leader>G"] = { desc=" GitHub Copilot" },
        ["<Leader>Ge"] = { "<cmd>Copilot enable<cr>", desc="Enable Copilot" },
        ["<Leader>Gd"] = { "<cmd>Copilot disable<cr>", desc="Disable Copilot" },
        -- ["<Leader>m"] = { desc="Neominimap" },
        -- ["<Leader>me"] = { "<cmd>Neominimap BufEnable<cr>", desc="Enable minimap" },
        -- ["<Leader>md"] = { "<cmd>Neominimap BufDisable<cr>", desc="Disable minimap" },
        -- ["<Leader>mt"] = { "<cmd>Neominimap BufToggle<cr>", desc="Toggle minimap" },
      },
      t = {
        -- setting a mapping to false will disable it
      },
    },
  },
}
