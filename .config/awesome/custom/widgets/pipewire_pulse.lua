local awful = require("awful")
local beautiful = require("beautiful")
local lain = require("lain")
local apps = require("custom.apps")

local markup = lain.util.markup

local pipewire_pulse = awful.widget.watch(
    'bash -c "pactl list sinks | grep -m 1 Volume | cut -d \"/\" -f 2 | tr -d [:blank:]"',
    1,
    function(widget, stdout)
        local header = beautiful.vol_icon
        widget:set_markup(
            markup.font(beautiful.icon_font, markup(beautiful.icon_accent, header))
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
