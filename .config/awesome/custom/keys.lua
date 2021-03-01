local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
--local naughty = require("naughty")
local lain = require("lain")

local hotkeys_popup = require("awful.hotkeys_popup")

local modkey = "Mod4"
local altkey = "Mod1"


local keys = {}
local apps = require("custom.apps")
local settings = require("custom.settings")
--
-- {{{ Mouse bindings
-- keys.mousebuttons(gears.table.join(
               -- awful.button({ }, 3, function () awesome.emit_signal("mymainmenu::toggle") end)
-- Rotate through workspaces with mousewheel
--     awful.button({ }, 4, awful.tag.viewnext),
--     awful.button({ }, 5, awful.tag.viewprev)
-- ))
-- }}}

-- {{{ Key bindings
keys.globalkeys = gears.table.join(

    -- Take a screenshot
    -- https://github.com/lcpz/dots/blob/master/bin/screenshot
    -- awful.key({ altkey }, "p", function() os.execute("screenshot") end,
    --           {description = "take a screenshot", group = "hotkeys"}),

    -- X screen locker
    -- awful.key({ altkey, "Control" }, "l", function () os.execute(scrlocker) end,
              -- {description = "lock screen", group = "hotkeys"}),

    -- Hotkeys
    awful.key({ modkey, "Shift"   }, "s",      hotkeys_popup.show_help,
              {description = "show help", group="awesome"}),
    -- Tag browsing
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    -- Non-empty tag browsing
    awful.key({ altkey }, "Left", function () lain.util.tag_view_nonempty(-1) end,
              {description = "view  previous nonempty", group = "tag"}),
    awful.key({ altkey }, "Right", function () lain.util.tag_view_nonempty(1) end,
              {description = "view  previous nonempty", group = "tag"}),

    -- Default client focus
    -- awful.key({ altkey,           }, "j",
    --     function ()
    --         awful.client.focus.byidx( 1)
    --     end,
    --     {description = "focus next by index", group = "client"}
    -- ),
    -- awful.key({ altkey,           }, "k",
    --     function ()
    --         awful.client.focus.byidx(-1)
    --     end,
    --     {description = "focus previous by index", group = "client"}
    -- ),

    -- By direction client focus
    awful.key({ modkey }, "j",
        function()
            awful.client.focus.global_bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}),
    awful.key({ modkey }, "k",
        function()
            awful.client.focus.global_bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}),
    awful.key({ modkey }, "h",
        function()
            awful.client.focus.global_bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}),
    awful.key({ modkey }, "l",
        function()
            awful.client.focus.global_bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus right", group = "client"}),
    awful.key({ modkey,           }, "w", function () awful.util.mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.bydirection("down")    end,
              {description = "swap client down", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.bydirection("up")    end,
              {description = "swap client up", group = "client"}),
    awful.key({ modkey, "Shift"   }, "h", function () awful.client.swap.bydirection("left")    end,
              {description = "swap client left", group = "client"}),
    awful.key({ modkey, "Shift"   }, "l", function () awful.client.swap.bydirection("right")    end,
              {description = "swap client right", group = "client"}),
    awful.key({ modkey, }, "o", function () awful.screen.focus_relative( 1) end,
              {description = "focus next screen", group = "screen"}),
    -- awful.key({ modkey, altkey }, "h", function () awful.screen.focus_relative(-1) end,
    --           {description = "focus the previous screen", group = "screen"}),
    -- awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
    --           {description = "jump to urgent client", group = "client"}),

    awful.key({ altkey, "Shift"     }, "Tab",
        function ()
            if settings.cycle_prev then
                awful.client.focus.history.previous()
            else
                awful.client.focus.byidx(-1)
            end
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "cycle through clients forward", group = "client"}),
    awful.key({ altkey }, "Tab",
        function ()
            if settings.cycle_prev then
                awful.client.focus.byidx(1)
            else
                awful.client.focus.byidx(1)
            end
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "cycle through clients backward", group = "client"}),

    -- Show/Hide Wibox
    -- awful.key({ modkey }, "b", function ()
    --         for s in screen do
    --             s.mywibox.visible = not s.mywibox.visible
    --             if s.mybottomwibox then
    --                 s.mybottomwibox.visible = not s.mybottomwibox.visible
    --             end
    --         end
    --     end,
    --     {description = "toggle wibox", group = "awesome"}),

    -- On the fly useless gaps change
    -- awful.key({ altkey, "Control" }, "+", function () beautiful.useless_gaps = beautiful.useless_gaps + 1 end,
    --          {description = "increment useless gaps", group = "tag"}),
    -- awful.key({ altkey, "Control" }, "-", function () beautiful.useless_gaps = beautiful.useless_gaps - 1 end,
    --          {description = "decrement useless gaps", group = "tag"}),


    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    -- awful.key({ modkey, "Shift"   }, "q", awesome.quit,
    --           {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey, altkey   }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey, altkey }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Control"  }, "k",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of rows (aka. masters)", group = "layout"}),
    awful.key({ modkey, "Control"   }, "j",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of rows (aka. masters)", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next layout", group = "layout"}),
    -- awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
    --           {description = "select previous", group = "layout"}),


    -- Brightness
    -- awful.key({ }, "XF86MonBrightnessUp", function () os.execute("xbacklight -inc 10") end,
    --           {description = "+10%", group = "hotkeys"}),
    -- awful.key({ }, "XF86MonBrightnessDown", function () os.execute("xbacklight -dec 10") end,
    --           {description = "-10%", group = "hotkeys"}),

    -- -- Pulse volume control
    awful.key({ }, "XF86AudioRaiseVolume",
        function ()
            os.execute("pactl set-sink-volume @DEFAULT_SINK@ +5%")
        end,
        {description = "volume up", group = "audio"}),
    awful.key({  }, "XF86AudioLowerVolume",
        function ()
            os.execute("pactl set-sink-volume @DEFAULT_SINK@ -5%")
        end,
        {description = "volume down", group = "audio"}),
    -- awful.key({  }, "XF86AudioMute",
        -- function ()
            -- os.execute("pactl set-sink-mute @DEFAULT_SINK@ toggle")
            -- beautiful.volume.update()
        -- end,
        -- {description = "toggle mute", group = "audio"}),

    -- ALSA Volume control
    -- awful.key({ }, "XF86AudioRaiseVolume",
    --     function ()
    --         os.execute("amixer -q set Master 5%+")
    --         beautiful.alsa.update()
    --     end,
    --     {description = "volume up", group = "audio"}),
    -- awful.key({  }, "XF86AudioLowerVolume",
    --     function ()
    --         os.execute("amixer -q set Master 5%-")
    --         beautiful.alsa.update()
    --     end,
    --     {description = "volume down", group = "audio"}),

    -- MPD control
    awful.key({ }, "XF86AudioPlay",
        function ()
            os.execute("mpc toggle")
            beautiful.mpd.update()
        end,
        {description = "mpc: toggle play or pause", group = "audio"}),

    awful.key({ }, "XF86AudioPrev",
        function ()
            os.execute("mpc prev")
            beautiful.mpd.update()
        end,
        {description = "mpc: previous song", group = "audio"}),
    awful.key({  }, "XF86AudioNext",
        function ()
            os.execute("mpc next")
            beautiful.mpd.update()
        end,
        {description = "mpc: next song", group = "audio"}),

    -- Take Screenshot using flameshot
    awful.key({}, "Print", function () os.execute("flameshot gui") end,
    	      {description = "take screenshot", group = "hotkeys"}),

    -- Copy primary to clipboard (terminals to gtk)
    awful.key({ modkey, "Control" }, "c", function () awful.spawn.with_shell("xsel | xsel -i -b") end,
              {description = "copy terminal to gtk", group = "hotkeys"}),
    -- Copy clipboard to primary (gtk to terminals)
    awful.key({ modkey, "Control" }, "v", function () awful.spawn.with_shell("xsel -b | xsel") end,
              {description = "copy gtk to terminal", group = "hotkeys"}),

    -- User programs
    awful.key({ modkey }, "space", function() awful.spawn.with_shell("rofi -show drun -modi drun,window,run") end,
              {description = "show rofi", group = "shortcuts"}),
    awful.key({ modkey }, "Return", function () awful.spawn(apps.terminal) end,
              {description = "open a terminal", group = "shortcuts"}),
    awful.key({ modkey }, "s", function () awful.spawn("steam") end,
              {description = "start steam", group="shortcuts"}),
    awful.key({ modkey }, "b", function () awful.spawn(apps.browser) end,
              {description = "start browser", group = "shortcuts"}),
    awful.key({ modkey, "Shift" }, "b", function () awful.spawn(apps.browser2) end,
              {description = "start minimal browser", group = "shortcuts"}),
    awful.key({ modkey }, "r", function() awful.spawn(apps.terminal.. " ranger") end,
              {description = "run ranger", group = "shortcuts"}),
    awful.key({ modkey }, "v", function() awful.spawn("teamspeak3") end,
              {description = "run teamspeak", group = "shortcuts"}),
    awful.key({ modkey }, "p", function() awful.spawn("bwmenu") end,
              {description = "browse password manager", group = "shortcuts"})

)


-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 9 then
        descr_view = {description = "view tag #", group = "tag"}
        descr_toggle = {description = "toggle tag #", group = "tag"}
        descr_move = {description = "move focused client to tag #", group = "tag"}
        descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
    end
    keys.globalkeys = gears.table.join(keys.globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  descr_view),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  descr_toggle),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  descr_move),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  descr_toggle_focus)
    )
end

keys.clientkeys = gears.table.join(
    awful.key({ altkey, "Shift"   }, "m",      lain.util.magnify_client,
              {description = "magnify client", group = "client"}),
    awful.key({ modkey,"Shift"    }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Control"   }, "q",      function (c) c:kill()                         end,
              {description = "kill", group = "client"}),
    awful.key({ modkey,  }, "f",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,  "Shift"  }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to next screen", group = "client"}),
    awful.key({ modkey,  "Control"  }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey, }, "t", function (c) awful.titlebar.toggle(c) end,
              {description = "toggle titlebar", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey, "Shift" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "unminimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "maximize", group = "client"})
)

keys.clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

keys.tasklist = gears.table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            --c:emit_signal("request::activate", "tasklist", {raise = true})<Paste>

            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
        end
    end),
    awful.button({ }, 2, function (c) c:kill() end),
    awful.button({ }, 3, function ()
        local instance = nil

        return function ()
            if instance and instance.wibox.visible then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({theme = {width = dpi(250)}})
            end
        end
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)

keys.taglist = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end)
    --awful.button({ }, 3, awful.tag.viewtoggle),
    --awful.button({ modkey }, 3, function(t)
    --    if client.focus then
    --        client.focus:toggle_tag(t)
    --    end
    --end),
    --awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    --awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

-- Set keys
root.keys(keys.globalkeys)
-- root.buttons(keys.mousebuttons)
-- }}}

return keys
