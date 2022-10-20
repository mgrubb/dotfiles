local settings = require('user-conf')
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- returns the require for use in `config` parameter
-- expects the name of the config file
--function get_config(name)
  --return string.format('require("config/%s-setup")', name)
--end
function get_config(name)
  return string.format("require('config/%s-setup')", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  execute("packadd packer.nvim")
end

-- init / config packer
local packer = require('packer')

packer.init({
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0, -- number of ms that a plugin load time must be over for it to be included in profile
})
