local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local lain  = require("lain")
local dpi   = require("beautiful.xresources").apply_dpi

local markup = lain.util.markup
local awesome, mouse = awesome, mouse

local powermenu = {}
powermenu.message = wibox.widget.textbox("")
--powermenu.message:set_markup(markup.font(beautiful.font, markup(beautiful.fg_normal, "Choose your destiny: ")))
powermenu.message:set_markup(markup.font(beautiful.font, markup(beautiful.fg_normal, "")))

powermenu.logout = wibox.widget.textbox("Logout")
powermenu.logout:buttons(awful.util.table.join(awful.button({},1,function() os.execute("mpc stop;") awesome.quit() end)))
powermenu.logout:set_markup(markup.font(beautiful.font, markup(beautiful.music_icon_color, "  ") .. markup(beautiful.fg_normal, "Logout ")))

powermenu.reboot = wibox.widget.textbox("Reboot")
powermenu.reboot:buttons(awful.util.table.join(awful.button({},1,function() os.execute("mpc stop; reboot") end)))
powermenu.reboot:set_markup(markup.font(beautiful.font, markup(beautiful.music_icon_color, " ".. markup(beautiful.fg_normal, "Reboot "))))

powermenu.shutdown = wibox.widget.textbox("Shutdown")
powermenu.shutdown:buttons(awful.util.table.join(awful.button({},1,function() os.execute("mpc stop; poweroff") end)))
powermenu.shutdown:set_markup(markup.font(beautiful.font, markup(beautiful.music_icon_color, " ".. markup(beautiful.fg_normal, "Poweroff "))))

powermenu.popup = awful.popup {
    visible = false,
    ontop = true,
    placement = awful.placement.top_right,
    -- preferred_positions = 'left',
    bg = beautiful.bg_normal,
    shape = gears.shape.rectangle,
    border_width = 0,
    offset = { y = beautiful.bar_height, x = dpi(2)},
    --maximum_width =150,
    -- border_color= beautiful.bg_focus,
    widget = {
        {
            powermenu.message,
            powermenu.logout,
            powermenu.reboot,
            powermenu.shutdown,
            layout = wibox.layout.fixed.horizontal
        },
        top = 2,
        left = 2560,
        bottom = 4,
        widget = wibox.container.margin
    }
}
powermenu.popup:connect_signal("mouse::leave",function() powermenu.popup.visible = false end)

powermenu.menu = wibox.widget.textbox ("Powermenu")
powermenu.menu:set_markup(markup.font(beautiful.icon_font, markup(beautiful.music_icon_color, "拉")))
powermenu.menu.valign = "center"
powermenu.menu:buttons(
    gears.table.join(
        awful.button({},1,nil,function()
            if powermenu.popup.visible then
                powermenu.popup.visible = not powermenu.popup.visible
            else
                powermenu.popup:move_next_to(mouse.current_widget_geometry)
                powermenu.popup.visible = true
            end
        end)
    )
)

return powermenu.menu
