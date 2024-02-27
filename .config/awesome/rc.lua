-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

RC = {} -- global namespace, on top before require any modules
RC.vars = require("main.user-variables")

-- Error handling
require("main.error-handling")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/" .. "dwalker/theme.lua")
beautiful.useless_gap = 3
-- }}}

modkey = RC.vars.modkey

-- Custom Local Library
local main = {
  layouts = require("main.layouts"),
  tags = require("main.tags"),
  menu = require("main.menu"),
  rules = require("main.rules")
}

-- Custom Local Library: Keys and Mouse Binding
local bindings = {
  globalbuttons = require("bindings.globalbuttons"),
  clientbuttons = require("bindings.clientbuttons"),
  globalkeys = require("bindings.globalkeys"),
  clientkeys = require("bindings.clientkeys"),
  bindtotags = require("bindings.bindtotags"),
}

-- Layouts
RC.layouts = main.layouts()

-- Tags
RC.tags = main.tags()

-- Menu
RC.mainmenu = awful.menu({ items = main.menu() })
RC.launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = RC.mainmenu })

-- Menubar configuration
menubar.utils.terminal = RC.vars.terminal -- Set the terminal for applications that require it

-- Mouse and Key bindings
RC.globalkeys = bindings.globalkeys()
RC.globalkeys = bindings.bindtotags(RC.globalkeys)

-- Set root
root.buttons(bindings.globalbuttons())
root.keys(RC.globalkeys)

-- Statusbar
require("deco.statusbar")

-- Rules
awful.rules.rules = main.rules(bindings.clientkeys(), bindings.clientbuttons())

-- Signals
require("main.signals")

-- Autorun scripts
awful.spawn.with_shell(os.getenv("HOME") .. "/.config/awesome/autorun.sh")
