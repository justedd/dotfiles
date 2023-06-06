-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- TODO: extract window control keys

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
--require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

--local wibar_visibility_control = require('wibar_visibility_control')
local current_tag = require('current_tag')
local tiny_clock = require('tiny_clock')
local tiny_connection = require('tiny_connection')
local tiny_sound = require('tiny_sound')
local tiny_volume = require('tiny_volume')
local window_utils = require('window_utils')


function debug_msg(msg)
  naughty.notify({ title = msg, message = msg, timeout = 5 })
end

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("~/.config/awesome/theme.lua")

local terminal = "kitty"
local modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    --awful.layout.suit.floating,
}
-- }}}

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

local function set_wallpaper(s)
  if beautiful.wallpaper then
    for s = 1, screen.count() do
      if s < 2 then
        gears.wallpaper.maximized("/home/justed/Pictures/Wallpapers/left.png", s, true)
      else
        gears.wallpaper.maximized("/home/justed/Pictures/Wallpapers/right.png", s, true)
      end
    end
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)


awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    awful.tag(
    {
      "main",
      "post",
      "telegram",
      "slack",
      "work_code",
      "work_view",
      "other_1",
      "other_2",
      "other_3",
    },
      s,
      {
        awful.layout.suit.tile,
        --awful.layout.suit.floating,
      }
    )

    current_tag.init(s)
    tiny_clock.init(s)
    tiny_sound.init(s)
    tiny_connection.init(s)
    tiny_volume.init(s)
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
    --awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button(
      {}, 3,
      function()
        if 1440 - mouse.coords().y > 100 then
          return
        end

        window_utils.previous_workspace(true)
      end
    ),
    awful.button(
      {}, 1,
      function()
        if 1440 - mouse.coords().y > 100 then
          return
        end

        window_utils.next_workspace(true)
      end
    ),
    awful.button(
      {}, 2,
      function()
        local height = 30
        local width = 500

        if (mouse.coords().x > 2560 * 2 - width) and (mouse.coords().y < height) then
          window_utils.jump_to_tag(1)
        end

        if (mouse.coords().x > 2560 * 2 - height) and (mouse.coords().y < width) then
          window_utils.jump_to_tag(5)
        end
      end
    )
))
-- }}}

-- {{{ Key bindings
local globalkeys = gears.table.join(
  -- my keybindings

  -- end of my keybindings

    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "h",
        function ()
          awful.client.focus.global_bydirection('left')
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "j",
        function ()
          awful.client.focus.global_bydirection('down')
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
          awful.client.focus.global_bydirection('up')
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey,           }, "l",
        function ()
          awful.client.focus.global_bydirection('right')
        end,
        {description = "focus previous by index", group = "client"}
    ),
    awful.key({ modkey }, 'i', window_utils.previous_workspace_with_focus),
    awful.key({ modkey }, 'u', window_utils.next_workspace_with_focus),

    -- Layout manipulation
    awful.key({ modkey, "Control" }, "j", function () awful.client.swap.byidx(1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.client.swap.byidx(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    -- Standard program
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift" }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,  "Shift" }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.incwfact(0.05)  end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.incwfact(-0.05)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                    c:emit_signal(
                        "request::activate", "key.unminimize", {raise = true}
                    )
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r",     function () awful.util.spawn('rofi -show drun') end,
              {description = "run prompt", group = "launcher"}),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"}),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "launcher"})
)

local mediakeys = require('mediakeys')

globalkeys = gears.table.join(
  globalkeys,
  mediakeys
)

clientkeys = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = gears.table.join(
    globalkeys,
    -- View tag only.
    awful.key(
      { modkey },
      '#' .. i + 9,
      function() 
        window_utils.jump_to_tag(i)
      end,
      { description = 'view tag #'..i, group = 'tag' }
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
      { description = 'move focused client to tag #'..i, group = 'tag' }
    )
  )
end

clientbuttons = gears.table.join(
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

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    --{
      --rule = {
        --{ class = "[Ss]potify" }
      --},
      --properties = {
        --tag = 'main',
        --screen = 2
      --}
    --},

    -- Floating clients.
    { rule_any = {
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
          "xtightvncviewer"},

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
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end

    c.shape = function(cr,w,h)
      gears.shape.rounded_rect(cr,w,h,5)
    end
end)

--client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
--client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

-- Enable sloppy focus, so that focus follows mouse.
--client.connect_signal("mouse::enter", function(c)
    --c:emit_signal("request::activate", "mouse_enter", {raise = false})
--end)


beautiful.useless_gap = 10

naughty.config.defaults.position = 'bottom_right'
naughty.config.defaults.screen = 2


-- mailspring hack
beautiful.notification_icon_size = 35

--require 'autorun'.init(awful)

dofile(awful.util.getdir("config") .. "/" .. 'autorun.lua')

function arrange_with_timeout(client, class, id, index)
  client.connect_signal("property::class", function(c)
    if c.class == class then
      gears.timer {
        timeout   = 0.10,
        call_now  = false,
        autostart = true,
        single_shot = true,
        callback  = function()
          local t = awful.tag.find_by_name(screen[index], id)
          c:move_to_tag(t)
        end
      }
    end
  end)
end

arrange_with_timeout(client, "yandex-music-player", "main", 1)
arrange_with_timeout(client, "TelegramDesktop", "telegram", 1)
arrange_with_timeout(client, "Slack", "slack", 1)
arrange_with_timeout(client, "Mailspring", "post", 1)

awful.ewmh.add_activate_filter(function() return false end, "ewmh")
