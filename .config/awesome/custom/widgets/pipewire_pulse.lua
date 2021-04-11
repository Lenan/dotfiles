local awful = require("awful")
local beautiful = require("beautiful")
local lain = require("lain")
local apps = require("custom.apps")

local markup = lain.util.markup

local pipewire_pulse = awful.widget.watch(
    'bash -c "pactl list sinks | grep \'Volume: front-left\' | cut -d \' \' -f 6 | tr -d [:blank:]"',
    1,
    function(widget, stdout)
        local header = beautiful.vol_icon
        widget:set_markup(
            markup.font(beautiful.icon_font, markup(beautiful.vol_icon_color, header))
            ..
            markup.font(beautiful.font,markup(beautiful.fg_normal," ".. stdout))
        )
    end
)
pipewire_pulse:buttons (
    awful.button({},1, function() --left click
            awful.spawn(apps.volcontrol)
    end)
)

return pipewire_pulse
