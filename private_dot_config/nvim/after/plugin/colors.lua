--vim.cmd.colorscheme('neodark')

local function loadScheme(scheme)
  return function()
    vim.cmd.colorscheme(scheme)
  end
end

local function loadStarry(variant)
  return function()
    vim.g.starry_italic_comments = true
    vim.g.starry_italic_keywords = true
    vim.g.starry_borders = true
    vim.g.starry_style = variant
    require('starry.functions').change_style(variant)
  end
end

local function loadFox(variant)
  return function()
    local nightfox = require('nightfox')
    nightfox.setup({
      options = {
        styles = {
          comments = 'italic',
          keywords = 'italic',
          types = 'bold',
        }
      }
    })
    require('nightfox.config').set_fox(variant)
    nightfox.load()
  end
end

local themes = {
  -- https://github.com/bluz71/vim-nightfly-colors
  ['nightfly'] = loadScheme('nightfly'),
  -- https://github.com/catppuccin/nvim
  ['catppuccin'] = loadScheme('catppuccin'),
  ['catppuccin-mocha'] = loadScheme('catppuccin-mocha'),
  ['catppuccin-macchiato'] = loadScheme('catppuccin-macchiato'),
  -- https://github.com/nxvu699134/vn-night.nvim
  ['vn-night'] = function() require('vn-night').setup() end,
  -- https://github.com/hoppercomplex/calvera-dark.nvim
  ['calvera'] = function()
    vim.g.calvera_italic_keywords = true
    vim.g.calvera_borders = true
    require('calvera').set()
  end,
  ['moonlight'] = function()
    vim.g.moonlight_italic_comments = true
    vim.g.moonlight_italic_keywords = true
    require('moonlight').set()
  end,
  -- https://github.com/ray-x/starry.nvim
  ['starry-dracula'] = loadStarry('dracula'),
  ['starry-moonlight'] = loadStarry('moonlight'),
  ['starry-middlenight_blue'] = loadStarry('middlenight_blue'),
  ['starry-earlysummer'] = loadStarry('earlysummer'),
  ['starry-darksolar'] = loadStarry('darksolar'),
  ['starry-oceanic'] = loadStarry('oceanic'),
  ['starry-deepocean'] = loadStarry('deepocean'),
  ['aurora'] = function()
    vim.g.aurora_italic = true
    vim.g.aurora_bold = true
    vim.cmd.colorscheme('aurora')
  end,
  ['nightfox-nightfox'] = loadFox('nightfox'),
  ['nightfox-duskfox'] = loadFox('duskfox'),
  ['nightfox-carbonfox'] = loadFox('carbonfox'),
}
local allThemes = {}
for k, _ in pairs(themes) do table.insert(allThemes, k) end
local theme = allThemes[math.random(#allThemes)]
print("Currently set theme is", theme)
themes[theme]()
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
