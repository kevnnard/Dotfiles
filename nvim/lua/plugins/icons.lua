-- En ~/.config/nvim/lua/plugins/icons.lua o similar
return {
  "nvim-tree/nvim-web-devicons",
  opts = {
    override = {
      astro = {
        icon = "󱓟",
        color = "#FF7E33",
        name = "Astro",
      },
    },
  },
}
