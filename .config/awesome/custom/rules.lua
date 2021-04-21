local awful = require("awful")
local beautiful = require("beautiful")
local ruled = require("ruled")
local keys = require("custom.keys")

-- -- {{{ Rules
-- Rules to apply to new notifications
ruled.notification.connect_signal('request::rules', function()
    ruled.notification.append_rules ({
    -- Ignore notifications of KXStudio's Cadence/LADISH
    { rule_any = { message = {"Studio.*", "LADI.*", "JACK .*"}},
      properties = { ignore = true }},
    { rule = { },
      properties = {
        border_width = beautiful.notification_border_width,
        border_color = beautiful.notification_border_color
      }
    },
})
end)

-- Rules to apply to new clients (through the "manage" signal).
ruled.client.append_rules ({
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = keys.clientkeys,
                     buttons = keys.clientbuttons,
                     screen = awful.screen.focused,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     size_hints_honor = true
      }, callback = awful.client.setslave
    },

    -- Titlebars
    { rule_any = { type = { "dialog", "normal" } },
        properties = { titlebars_enabled = false }
    },

    -- Set Firefox to always map on the first tag on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = awful.util.tagnames[1] } },

    --Rules for kitty
    { rule_any = { class = { "kitty" } },
--      properties = { screen = awful.screen.focused, tag = "", switch_to_tags = true } --Nerd Font
      properties = { screen = awful.screen.focused, tag = "", switch_to_tags = true, } --Font Awesome
    },

    --Rules for GIMP
    { rule_any = { class = { "Gimp" }, role = { "gimp-image-window" } },
      properties = { maximized = true }
    },

    { rule_any = { name = { "Firefox" } },
--       properties = { screen = awful.screen.focused, tag = "爵", switch_to_tags = true } -- Nerd Font
       properties = { screen = awful.screen.focused, tag = "", switch_to_tags = true }
    },

    { rule_any = { class = { "qutebrowser" } },
--       properties = { screen = awful.screen.focused, tag = "爵", switch_to_tags = true } -- Nerd Font
       properties = { screen = awful.screen.focused, tag = "", switch_to_tags = true }
    },
    -- Rule for Variety Wallpapers
    { rule_any = { name = { "Variety .*" } },
      except_any = { name = { "Variety Preferences" } },
      properties = { floating = true, ontop = true, border_width = 0, maximized_vertical = true }
    },

    -- Rule for Origin
    { rule_any = { instance = { "origin.exe" }, name = { "Origin.*" } },
      properties = { floating = true, placement = awful.placement.centered }
    },

    -- Rule for Epic Games Launcher
    { rule_any = { instance = { "epicgameslauncher.exe" }, name = { "Epic Games Launcher.*" } },
      properties = { floating = true }
    },


    { rule_any = { name = { "Lutris" } },
 --      properties = { screen = awful.screen.focused, tag = "", switch_to_tags = true } -- Nerd Font
       properties = { screen = awful.screen.focused, tag = "", switch_to_tags = true }
    },

    -- Rules for Steam
    { rule_any = { name = { "Steam" } },
--      properties = { screen = awful.screen.focused, tag = "", switch_to_tags = true } -- Nerd Font
      properties = { screen = awful.screen.focused, tag = "", switch_to_tags = true }
    },

    { rule_any = { name = { "Steam Controller Configuration" } },
      properties = { floating = true }
    },

    { rule_any = { name = { "Friends List.*" } },
      properties = { screen = 2 }
    },

    { rule_any = { class = { "steam_app_.*" } },
      properties = { maximized = true, fullscreen = true }
    },

    -- Rule for Teamspeak
    { rule_any = { name = { "TeamSpeak 3" } },
      properties = { screen = 2 }
    }
})
-- }}}
