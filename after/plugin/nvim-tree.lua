local nvim_tree_events = require('nvim-tree.events')
local nvim_tree_api = require('nvim-tree.api')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)
vim.keymap.set('n', '<leader>pv', function() 
    nvim_tree_api.tree.focus()
end) 
