local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local settings = require("custom.settings")

local awesome, client, screen = awesome, client, screen
-- {{{ Signals

-- Signal function to execute when a new client appears.
client.connect_signal("request::manage", function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- Custom
    if beautiful.titlebar_fun then
        beautiful.titlebar_fun(c)
        return
    end

    -- Default
    -- buttons for the titlebar
    local buttons = gears.table.join(awful.button({}, 1, function()
        c:emit_signal("request::activate", "titlebar", {raise = true})
        awful.mouse.client.move(c)
    end), awful.button({}, 2, function()
        c:kill()
    end), awful.button({}, 3, function()
        c:emit_signal("request::activate", "titlebar", {raise = true})
        awful.mouse.client.resize(c)
    end))

    local titlewidget = awful.titlebar.widget.titlewidget(c)
    titlewidget.ellipsize = "end"

    awful.titlebar(c, {
        size = beautiful.bar_height,
        bg_normal = beautiful.titlebar_bg_normal,
        bg_focus = beautiful.titlebar_bg_focus
    }):setup{
        { -- Left
            awful.titlebar.widget.iconwidget(c),
            titlewidget,
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal
        },
        { -- Middle
            -- { -- Title
            -- align  = "center",
            -- widget = titlewidget
            -- },
            -- buttons = buttons,
            layout = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.stickybutton(c),
            awful.titlebar.widget.ontopbutton(c),
            awful.titlebar.widget.floatingbutton(c),
            awful.titlebar.widget.minimizebutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.closebutton(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }

end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = settings.vi_focus})
end)

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
end)

---- THIS CAN CAUSE SCREEN FREEZES, DO NOT USE
-- local function set_no_border(s)
--    local only_one = #s.tiled_clients == 1
--    for _, c in pairs(s.clients) do
-- if only_one and not c.floating or c.maximized then
--            c.border_width = 0
--        else
--            c.border_width = beautiful.border_width
--        end
--    end
-- end
-- No borders when rearranging only 1 non-floating or maximized client
-- screen.connect_signal("arrange", set_no_border)

-- This is in an unreliable state... use manual wibar hiding if you need to.
-- Hide wibar when a client is in fullscreen
-- local function hide_wibar_when_fullscreen(s)
--     for _, c in pairs(s.clients) do
--         if c.fullscreen then
--             s.mywibox.visible = false
--             return
--         else
--             s.mywibox.visible = true
--             return
--         end
--     end
-- end
-- screen.connect_signal("arrange", hide_wibar_when_fullscreen)

-- possible workaround for tag preservation when switching back to default screen:
-- https://github.com/lcpz/awesome-copycats/issues/251
-- }}}
