local cfg = {}


cfg.mash = {'ctrl', 'alt', 'cmd'}


----------------------------
--  Hammerspoon settings  --
----------------------------

hs.window.animationDuration = 0 -- disable animations
hs.menuIcon(true)
hs.consoleOnTop(true)

--hs.hints.fontName = "DejaVu Sans Mono"
hs.hints.fontSize = 14
hs.hints.showTitleThresh = 8


---------------
--  Layouts  --
---------------

cfg.dualLayout = {
  ["Emacs"] = {{Action.MoveToScreen(1), Action.MoveToUnit(0, 0, 0.55, 1)}},
  ["iTerm2"] = {
    ["localhost"] = {Action.MoveToScreen(1), Action.MoveToUnit(0.552, 0, 0.45, 1)},
    ["remote"] = {Action.MoveToScreen(2), Action.MoveToUnit(0.552, 0, 0.45, 1)}
  },
  ["Spotify"] = {{Action.MoveToScreen(2), Action.FullScreen()}},
  ["Google Chrome"] = {{Action.MoveToScreen(2), Action.MoveToUnit(0, 0, 0.55, 1)}},
}

cfg.singleLayout = {
  ["Emacs"] = {{Action.MoveToUnit(0, 0, 0.50, 1)}},
  ["Google Chrome"] = {{Action.Maximize()}},
  ["Spotify"] = {{Action.FullScreen()}},
  ["iTerm2"] = {
    ["localhost"] = {Action.MoveToUnit(0.502, 0, 0.5, 1)},
    ["remote"] = {Action.MoveToUnit(0.502, 0, 0.5, 1)}
  }
}


------------------------------
--  Hardware Notifications  --
------------------------------

-- cfg.notifications = {
--   enableBattery = false,
--   enableVolumes = true,
--   enableUsb = true,
--   enableWifi = true,
--   enableNetwork = true
-- }


----------------------------------------------------------------------
--  Automatically enable / disable Bluetooth on monitor connection  --
--  Requires https://github.com/toy/blueutil                        --
----------------------------------------------------------------------

-- cfg.manageBluetooth = false


return cfg
