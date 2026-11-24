-- Entry point for themes

local gears = require("gears")
local naughty = require("naughty")
local dpi = require("beautiful.xresources").apply_dpi

-- For changing themes
local chosen_theme = "pastel"
local dir                                       = gears.filesystem.get_configuration_dir()
local colors                                    = require("themes." .. chosen_theme .. ".colors")

local theme                                     = colors
theme.font                                      = "Source Code Pro Medium 10"
theme.taglist_font                              = theme.font
theme.wallpaper                                 = dir .. "/wallpaper.png"

theme.notification_font                         = "Iosevka NF Medium 12"
theme.notification_max_width                    = 400

theme.fg_normal                                 = theme.fg_main
theme.fg_focus                                  = theme.green
theme.bg_normal                                 = theme.bg_main
theme.bg_focus                                  = theme.bg_main
theme.fg_urgent                                 = theme.red
theme.bg_urgent                                 = theme.black
theme.border_normal                             = theme.bg_main
theme.border_focus                              = theme.bg_accent_alt

theme.taglist_fg_focus                          = theme.fg_main
theme.taglist_bg_focus                          = theme.bg_accent_alt
theme.taglist_fg_occupied                       = theme.fg_main
theme.taglist_fg_empty                          = theme.fg_dim
theme.taglist_fg_urgent                         = theme.fg_main
theme.taglist_bg_urgent                         = theme.red
theme.taglist_squares_sel                       = dir .. "icons/square_sel.png"
theme.taglist_squares_unsel                     = dir .. "icons/square_unsel.png"

theme.barcolor                                  = theme.bg_main
theme.bg_systray                                = theme.bg_main
theme.border_width                              = dpi(4)
theme.useless_gap                               = dpi(6)

theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true

theme.notification_fg                           = theme.fg_accent_alt
theme.notification_bg                           = theme.bg_main
theme.notification_border_color                 = theme.bg_accent_alt

naughty.config.defaults.margin                  = dpi(12)

theme.menubar_fg_focus                          = theme.fg_accent_alt
theme.menubar_bg_focus                          = theme.bg_accent_alt
theme.menubar_fg_normal                         = theme.fg_dim
theme.menubar_bg_normal                         = theme.bg_main
theme.menubar_border_color                      = theme.bg_main
theme.menubar_border_width                      = dpi(4)
theme.menu_submenu_icon                         = dir .. "icons/submenu.png"

theme.layout_tile                               = dir .. "icons/tile.png"
theme.layout_tileleft                           = dir .. "icons/tileleft.png"
theme.layout_tilebottom                         = dir .. "icons/tilebottom.png"
theme.layout_tiletop                            = dir .. "icons/tiletop.png"
theme.layout_fairv                              = dir .. "icons/fairv.png"
theme.layout_fairh                              = dir .. "icons/fairh.png"
theme.layout_spiral                             = dir .. "icons/spiral.png"
theme.layout_dwindle                            = dir .. "icons/dwindle.png"
theme.layout_max                                = dir .. "icons/max.png"
theme.layout_fullscreen                         = dir .. "icons/fullscreen.png"
theme.layout_magnifier                          = dir .. "icons/magnifier.png"
theme.layout_cornernw                           = dir .. "icons/cornernw.png"
theme.layout_floating                           = dir .. "icons/floating.png"

theme.titlebar_close_button_focus               = dir .. "icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = dir .. "icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = dir .. "icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = dir .. "icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = dir .. "icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = dir .. "icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = dir .. "icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = dir .. "icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = dir .. "icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = dir .. "icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = dir .. "icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = dir .. "icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = dir .. "icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = dir .. "icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = dir .. "icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = dir .. "icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = dir .. "icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = dir .. "icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_minimize_button_focus            = dir .. "icons/titlebar/minimize_focus.png"
theme.titlebar_minimize_button_normal           = dir .. "icons/titlebar/minimize_normal.png"

theme.awesome_icon                              = dir .. "icons/arch.png"


-- Rounded corners
-- theme.rounded_corner                         = 16
-- theme.notification_shape                     = function (cr, w, h)
--    gears.shape.rounded_rect(cr, w, h, theme.rounded_corner)
-- end

return theme
