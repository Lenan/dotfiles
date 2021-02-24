local awful = require("awful")
local beautiful = require("beautiful")
local lain = require("lain")

local font = beautiful.font
local markup = lain.util.markup
local accent = beautiful.border_focus
local normal = beautiful.fg_normal

-- ALSA volume
local widget = {}

widget.alsa = lain.widget.alsa({
    settings = function()
        header =" "
        if volume_now.status == "off" then
            v = "off"
        else
            v = volume_now.level .. "% "
        end
        widget:set_markup(markup.font(font, markup(accent, header) .. markup(normal, v)))
    end
})

widget.alsa.widget:buttons(awful.util.table.join(
    awful.button({}, 1, function ()
        awful.spawn("pavucontrol &")
    end),
    awful.button({}, 4, function() -- scroll up
        os.execute(string.format("%s set %s 5%%+", widget.alsa.cmd, widget.alsa.channel))
        widget.alsa.update()
    end),
    awful.button({}, 5, function() -- scroll down
        os.execute(string.format("%s set %s 5%%-", widget.alsa.cmd, widget.alsa.channel))
        widget.alsa.update()
    end)
))

return widget
