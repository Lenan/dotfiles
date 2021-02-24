local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local theme = require("beautiful")
local lain = require("lain")
local dpi = require("beautiful.xresources").apply_dpi
local keys = require("custom.keys")
local tags = require("custom.tags")

local markup = lain.util.markup

local cpu = require("custom.widgets.cpu")


local wibar = {}

local tagnames = {"1","2"}
function wibar.on_screen_connect(s)
    s.cpu = cpu
    -- Quake application
    -- s.quake = lain.util.quake({ app = apps.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(tagnames, s, layouts)

    -- Create  clock & calendar
   s.textclock = wibox.widget.textclock(
        markup(accent, " ") ..
        markup(normal, "%d %b ") ..
        markup(accent, " ") ..
        markup(normal, "%H:%M ")
   )
    s.textclock.font = theme.font

    s.cal = awful.widget.calendar_popup.month(
        {
            margin = dpi(4),
            bg = theme.bg_normal,
            style_focus = { fg_color = accent },
            style_month = {
                padding = dpi(10),
                border_color = accent,
                border_width = dpi(4)
            }
        }
    )
    s.cal:attach(s.textclock, 'tr')

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(awful.util.table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, keys.taglist)

    -- Create a tasklist widget
    -- s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)
    taskbtns = keys.tasklist
    s.mytasklist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons  = taskbtns,
        layout   = {
            layout  = wibox.layout.fixed.horizontal,
        },
        -- Notice that there is *NO* wibox.wibox prefix, it is a template,
        -- not a widget instance.
        widget_template = {
                    {
                        wibox.widget.base.make_widget(),
                        forced_height = 3,
                        id = 'background_role',
                        widget = wibox.container.background,
                    },
                    {
                        {
                            id = 'clienticon',
                            awful.widget.clienticon,
                            margins = dpi(5),
                            widget = wibox.container.margin
                        },
                        {
                            id = 'text_role',
                            widget = wibox.widget.textbox
                        },
                        layout = wibox.layout.align.horizontal,
                    },
                    layout = wibox.layout.fixed.vertical,
        }
    }
    -- Systray
    s.systray = wibox.widget.systray()
    s.systray:set_base_size(dpi(16))
    s.systraybox = wibox.widget {
            {
                {
                    widget = wibox.widget.systray(),
                },
                left = dpi(0),
                top = dpi(5),
                bottom = dpi(3),
                right = dpi(4),
                widget = wibox.container.margin,
            },
            widget=wibox.container.background,
        }

    -- -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = theme.bar_height, bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.align.horizontal,
            s.mylayoutbox,
            s.systraybox,
            -- s.mytaglist,
            -- s.mypromptbox,
        },
        {
            s.mytasklist, -- Middle widget
            expand = "none",
            layout = wibox.layout.fixed.horizontal,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- theme.mpd.widget,
            -- theme.volume.widget,
            -- theme.pulse.widget,
            -- theme.alsa.widget
            -- theme.pactl,
            -- theme.cpu.widget,
            -- theme.gpu,
            -- theme.gpu_percent_symbol,
            -- theme.mem.widget,
            -- theme.nordvpn,
            -- mytextclock,
            s.cpu,
            s.clock,
            -- powermenu.menu,
        },
    }
end
return wibar
