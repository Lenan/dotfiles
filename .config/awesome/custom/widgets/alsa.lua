local awful = require("awful")
local beautiful = require("beautiful")
local lain = require("lain")

local markup = lain.util.markup

local alsa = lain.widget.alsa({
    settings = function()
        local header = beautiful.vol_icon
        local v = "off"
        if volume_now.status ~= "off" then
            v = volume_now.level .. "% "
        end
        widget:set_markup(
            markup.font(beautiful.icon_font, markup(beautiful.vol_icon_color, header))
            ..
            markup.font(beautiful.font, markup(beautiful.fg_normal, v))
        )
    end
})
alsa.widget:buttons(awful.util.table.join(
    awful.button({}, 1, function ()
        awful.spawn("pavucontrol &")
    end),
    awful.button({}, 4, function() -- scroll up
        os.execute(string.format("%s set %s 5%%+",alsa.cmd, alsa.channel))
        alsa.update()
    end),
    awful.button({}, 5, function() -- scroll down
        os.execute(string.format("%s set %s 5%%-", alsa.cmd, alsa.channel))
        alsa.update()
    end)
))
return alsa
