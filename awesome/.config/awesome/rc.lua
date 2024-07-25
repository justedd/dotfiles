pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")
local my_hotkeys = require("hotkeys_help")
local hotkeys_popup = require("awful.hotkeys_popup.widget")

local my_hotkeys_popup = hotkeys_popup.new()
my_hotkeys_popup:add_hotkeys(my_hotkeys)

local current_tag = require('widgets/current_tag')
local tiny_clock = require('widgets/tiny_clock')
local tiny_connection = require('widgets/tiny_connection')
local tiny_sound = require('widgets/tiny_sound')
local tiny_locale = require('widgets/tiny_locale')
local tiny_volume = require('widgets/tiny_volume')

local window_utils = require('window_utils')
--local debug_msg = require('debug_msg')

dofile(awful.util.getdir("config") .. "/" .. 'load_recovery.lua')

beautiful.init("~/.config/awesome/theme.lua")

local modkey = "Mod4"

awful.layout.layouts = {
    awful.layout.suit.tile
}

screen.connect_signal("property::geometry", window_utils.set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    window_utils.set_wallpaper(s)

    awful.tag(
        {
            "main",
            "post",
            "telegram",
            "slack",
            "work_code",
            "work_view",
            "store",
            "other_1",
            "other_2",
            "other_3",
        },
        s,
        {
            awful.layout.suit.tile,
        }
    )

    current_tag.init(s)
    tiny_clock.init(s)
    tiny_sound.init(s)
    tiny_connection.init(s)
    tiny_locale.init(s)
    tiny_volume.init(s)
end)

local mouse_keys = require('mouse_keys')
root.buttons(mouse_keys)

local globalkeys = gears.table.join(
    awful.key(
        { modkey, }, "s",
        function()
            my_hotkeys_popup:show_help()
        end,
        { description = "show help", group = "awesome" }
    ),
    awful.key(
        { modkey, }, "h",
        function()
            awful.client.focus.global_bydirection('left')
        end,
        { description = "focus next by index", group = "client" }
    ),
    awful.key(
        { modkey, }, "j",
        function()
            awful.client.focus.global_bydirection('down')
        end,
        { description = "focus next by index", group = "client" }
    ),
    awful.key(
        { modkey, }, "k",
        function()
            awful.client.focus.global_bydirection('up')
        end,
        { description = "focus previous by index", group = "client" }
    ),
    awful.key(
        { modkey, }, "l",
        function()
            awful.client.focus.global_bydirection('right')
        end,
        { description = "focus previous by index", group = "client" }
    ),
    awful.key({ modkey }, 'i', window_utils.previous_workspace_with_focus),
    awful.key({ modkey }, 'u', window_utils.next_workspace_with_focus),

    awful.key(
        { modkey, "Control" }, "j",
        function()
            awful.client.swap.byidx(1)
        end,
        { description = "focus the next screen", group = "screen" }
    ),
    awful.key(
        { modkey, "Control" }, "k",
        function()
            awful.client.swap.byidx(-1)
        end,
        { description = "focus the previous screen", group = "screen" }
    ),
    awful.key(
        { modkey, "Control" }, "r", awesome.restart,
        { description = "reload awesome", group = "awesome" }
    ),
    awful.key(
        { modkey, "Shift" }, "l",
        function()
            awful.tag.incmwfact(0.05)
        end,
        { description = "increase master width factor", group = "layout" }
    ),
    awful.key(
        { modkey, "Shift" }, "h",
        function()
            awful.tag.incmwfact(-0.05)
        end,
        { description = "decrease master width factor", group = "layout" }
    ),
    awful.key(
        { modkey, "Shift" }, "j",
        function()
            awful.client.incwfact(0.05)
        end,
        { description = "swap with next client by index", group = "client" }
    ),
    awful.key(
        { modkey, "Shift" }, "k",
        function()
            awful.client.incwfact(-0.05)
        end,
        { description = "swap with previous client by index", group = "client" }
    ),
    awful.key(
        { modkey, "Control" }, "h",
        function()
            awful.tag.incncol(1, nil, true)
        end,
        { description = "increase the number of columns", group = "layout" }
    ),
    awful.key(
        { modkey, "Control" }, "l",
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        { description = "decrease the number of columns", group = "layout" }
    ),
    awful.key(
        { modkey, "Control" }, "n",
        function()
            local c = awful.client.restore()

            -- Focus restored client
            if c then
                c:emit_signal("request::activate", "key.unminimize", { raise = true })
            end
        end,
        { description = "restore minimized", group = "client" }
    ),
    awful.key(
        { modkey }, "r",
        function()
            awful.util.spawn('rofi -show drun')
        end,
        { description = "run prompt", group = "launcher" }
    ),

    awful.key(
        { modkey }, "x",
        function()
            awful.prompt.run {
                prompt = "Run Lua code: ",
                textbox = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        { description = "lua execute prompt", group = "awesome" }
    )
)

local mediakeys = require('mediakeys')

globalkeys = gears.table.join(
    globalkeys,
    mediakeys
)

local clientkeys = gears.table.join(
    awful.key({ modkey }, "f",
        function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" }
    ),
    awful.key(
        { modkey, "Shift" }, "c",
        function(c)
            c:kill()
        end,
        { description = "close", group = "client" }
    ),
    awful.key(
        { modkey, "Control" }, "space",
        awful.client.floating.toggle,
        { description = "toggle floating", group = "client" }
    ),
    awful.key(
        { modkey, "Control" }, "Return",
        function(c)
            c:swap(awful.client.getmaster())
        end,
        { description = "move to master", group = "client" }
    ),
    awful.key({ modkey }, "o",
        function(c)
            c:move_to_screen()
        end,
        { description = "move to screen", group = "client" }),
    awful.key(
        { modkey }, "t",
        function(c)
            c.ontop = not c.ontop
        end,
        { description = "toggle keep on top", group = "client" }),
    awful.key(
        { modkey }, "n",
        function(c)
            c.minimized = true
        end,
        { description = "minimize", group = "client" }
    ),
    awful.key(
        { modkey }, "m",
        function(c)
            c.maximized = not c.maximized
            c:raise()
        end,
        { description = "(un)maximize", group = "client" }
    ),
    awful.key(
        { modkey, "Control" }, "m",
        function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end,
        { description = "(un)maximize vertically", group = "client" }
    ),
    awful.key(
        { modkey, "Shift" }, "m",
        function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end,
        { description = "(un)maximize horizontally", group = "client" }
    )
)

for i = 1, 10 do
    globalkeys = gears.table.join(
        globalkeys,
        -- View tag only.
        awful.key(
            { modkey },
            '#' .. i + 9,
            function()
                window_utils.jump_to_tag(i)
            end,
            { description = 'view tag #' .. i, group = 'tag' }
        ),
        -- Move client to tag.
        awful.key(
            { modkey, 'Shift' },
            '#' .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = 'move focused client to tag #' .. i, group = 'tag' }
        )
    )
end

local clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ modkey }, 1, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
        c:emit_signal("request::activate", "mouse_click", { raise = true })
        awful.mouse.client.resize(c)
    end)
)

root.keys(globalkeys)

awful.rules.rules = {
    {
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen
        }
    },
    {
        rule_any = {
            instance = {
                "DTA",  -- Firefox addon DownThemAll.
                "copyq",  -- Includes session name in class.
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin",  -- kalarm.
                "Sxiv",
                "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
                "Wpa_gui",
                "veromix",
                "xtightvncviewer"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                "Event Tester",  -- xev.
            },
            role = {
                "AlarmWindow",  -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = {
            floating = true,
        }
    },

    {
        rule_any = {
            type = { "normal", "dialog" }
        },
        properties = {
            titlebars_enabled = true,
        }
    },
}

client.connect_signal("manage", function(c)
    if awesome.startup
        and not c.size_hints.user_position
        and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end

    c.shape = function(cr, w, h)
        gears.shape.rounded_rect(cr, w, h, 5)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)


naughty.config.defaults.position = 'bottom_right'
naughty.config.defaults.screen = 2
beautiful.useless_gap = 10
beautiful.notification_icon_size = 35

dofile(awful.util.getdir("config") .. "/" .. 'autorun.lua')

window_utils.arrange_with_timeout(client, "yandex-music-player", "main", 1)
window_utils.arrange_with_timeout(client, "TelegramDesktop", "telegram", 1)
window_utils.arrange_with_timeout(client, "Slack", "slack", 1)
window_utils.arrange_with_timeout(client, "Pachca", "slack", 1)
window_utils.arrange_with_timeout(client, "thunderbird", "post", 1)

awful.ewmh.add_activate_filter(function() return false end, "ewmh")
