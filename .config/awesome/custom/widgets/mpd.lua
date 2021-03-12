local awful = require("awful")
local beautiful = require("beautiful")
local lain = require("lain")
local apps = require("custom.apps")

local markup = lain.util.markup

local mpd = lain.widget.mpd({
    notify = "off",
    settings = function()
        local header = beautiful.music_icon
        local status = ""
        local artist = " " .. mpd_now.artist .. " "
        local title  = mpd_now.title
        local sep = "- "

        if mpd_now.state == "pause" then
            status = " "
        elseif mpd_now.state == "stop" then
            header = ""
            artist = ""
            title  = ""
            sep = ""
        end

        widget:set_markup(
            markup.font(beautiful.icon_font, markup(beautiful.icon_accent, status))
            ..
            markup.font(beautiful.icon_font, markup(beautiful.icon_accent, header))
            ..
            markup.font(beautiful.font, markup(beautiful.fg_normal,artist .. sep .. title))
        )
    end
})

mpd.widget:buttons(
    awful.util.table.join(
        awful.button({},1, function () -- left click
            os.execute("mpc toggle")
        end),
	awful.button({"Shift"},1,function () --shift + left click
            awful.spawn(apps.terminal .. " -e " .. apps.musicplayer)
    	end),
        awful.button({},2, function () -- middle click
            os.execute("mpc stop")
        end),
        awful.button({},3, function () -- right click
            os.execute("mpc next")
        end),
        awful.button({"Shift"},3, function () -- shift + right click
            os.execute("mpc prev")
        end)
    )
)

return mpd
