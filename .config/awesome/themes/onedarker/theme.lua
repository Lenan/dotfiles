local xrdb = require("beautiful.xresources").get_current_theme()
local dpi = require("beautiful.xresources").apply_dpi

local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome/themes/onedarker"
theme.wallpaper = os.getenv("HOME") .. "/.config/awesome/wallpaper.png"
theme.font = "JetBrainsMono Nerd Font 11.5"
theme.taglist_font = "JetBrainsMono Nerd Font Mono 15"
theme.icon_font = "JetBrains Nerd Font Mono 13"
theme.icon_accent = xrdb.color4
theme.fg_normal = xrdb.foreground
theme.fg_focus = xrdb.foreground
theme.fg_urgent = xrdb.foreground
theme.bg_normal = xrdb.background
theme.bg_shaded = xrdb.background
theme.bg_focus = xrdb.color4
theme.bg_urgent = "#292929"
theme.border_width = dpi(3)
theme.border_normal = xrdb.background
theme.border_focus = xrdb.color4
theme.titlebar_bg_normal = xrdb.background
theme.titlebar_fg_normal = xrdb.foreground
theme.titlebar_bg_focus = xrdb.color4
theme.titlebar_fg_focus = xrdb.foreground
theme.notification_bg = xrdb.color4
theme.notification_fg = xrdb.background
theme.notification_border_color = xrdb.color4
theme.notification_border_width = dpi(2)
theme.notification_width = dpi(325)
theme.taglist_fg_focus = xrdb.color1
theme.taglist_fg_occupied = xrdb.color4
theme.taglist_bg_focus = "#00000000"
theme.taglist_bg_occupied = "#00000000"
theme.taglist_spacing = dpi(0)
theme.taglist_margin_left = dpi(2)
theme.taglist_margin_right = dpi(2)
-- theme.taglist_squares_sel                    = theme.dir .. "/icons/square_sel.png"
-- theme.taglist_squares_unsel                  = theme.dir .. "/icons/square_unsel.png"
theme.bar_height = dpi(32)
theme.menu_height = dpi(24)
theme.menu_width = dpi(96)
theme.menu_submenu_icon = theme.dir .. "/icons/submenu.png"
theme.awesome_icon = theme.dir .. "/icons/awesome.png"
theme.layout_tile = theme.dir .. "/icons/tile/tile.png"
theme.layout_tileleft = theme.dir .. "/icons/tile/tileleft.png"
theme.layout_tilebottom = theme.dir .. "/icons/tile/tilebottom.png"
theme.layout_tiletop = theme.dir .. "/icons/tile/tiletop.png"
theme.layout_fairv = theme.dir .. "/icons/tile/fairv.png"
theme.layout_fairh = theme.dir .. "/icons/tile/fairh.png"
theme.layout_spiral = theme.dir .. "/icons/tile/spiral.png"
theme.layout_dwindle = theme.dir .. "/icons/tile/dwindle.png"
theme.layout_max = theme.dir .. "/icons/tile/max.png"
theme.layout_fullscreen = theme.dir .. "/icons/tile/fullscreen.png"
theme.layout_magnifier = theme.dir .. "/icons/tile/magnifier.png"
theme.layout_floating = theme.dir .. "/icons/tile/floating.png"
theme.useless_gap = dpi(5)
theme.gap_single_client = true
theme.systray_icon_spacing = dpi(0)
theme.systray_size = dpi(13)
theme.systray_margin_top = dpi(10)
theme.systray_margin_bot = dpi(0)
theme.systray_margin_left = dpi(0)
theme.systray_margin_right = dpi(0)
theme.powermenu_bg = xrdb.color5
theme.powermenu_fg = xrdb.foreground
theme.widget_spacing = dpi(10)
theme.tasklist_plain_task_name = false
theme.tasklist_disable_task_name = false
theme.tasklist_item_margins_top = dpi(3)
theme.tasklist_item_margins_bot = dpi(3)
theme.tasklist_item_margins_left = dpi(0)
theme.tasklist_item_margins_right = dpi(5)
theme.tasklist_icon_margins = dpi(5)
theme.titlebar_close_button_focus = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_minimize_button_focus_active = theme.dir .. "/icons/titlebar/minimized_focus_active.png"
theme.titlebar_minimize_button_normal_active = theme.dir .. "/icons/titlebar/minimized_normal_active.png"
theme.titlebar_minimize_button_focus_inactive = theme.dir .. "/icons/titlebar/minimized_focus_inactive.png"
theme.titlebar_minimize_button_normal_inactive = theme.dir .. "/icons/titlebar/minimized_normal_inactive.png"
theme.titlebar_maximized_button_focus_active = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

theme.cpu_icon = ""
theme.cpu_icon_color = xrdb.color1
theme.gpu_icon = "理"
theme.gpu_icon_color = xrdb.color2
theme.ram_icon = ""
theme.ram_icon_color = xrdb.color5
theme.vol_icon = "墳"
theme.vol_icon_color = xrdb.color4
theme.cal_icon = ""
theme.clock_icon = ""
theme.cal_icon_color = xrdb.color3
theme.vpn_icon_connected = "聯 "
theme.vpn_icon_color_connected = xrdb.color6
theme.vpn_icon_disconnected = "輦 "
theme.vpn_icon_color_disconnected = xrdb.color7
theme.music_icon = ""
theme.music_icon_color = xrdb.color6
theme.taglist_icons = {"", "", "", ""}

return theme
