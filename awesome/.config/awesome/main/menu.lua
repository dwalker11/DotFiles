-- Standard awesome library
local awful = require("awful")
-- Theme handling library
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup").widget


local M = {} -- menu
local _M = {} -- module

-- This is used later as the default terminal and editor to run.
local terminal = RC.vars.terminal

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = os.getenv("EDITOR") or "gvim"
local editor_cmd = terminal .. " -e " .. editor

M.awesomemenu = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end },
}

function _M.get ()
  -- Create a launcher widget and a main menu
  local menu_items = {
    { "awesome", M.awesomemenu, beautiful.awesome_icon },
    { "open terminal", terminal }
  }

  return menu_items
end

return setmetatable(
  {}, 
  { __call = function(_, ...) return _M.get(...) end }
)