require 'utils'
require 'action'
cfg = require 'config'


function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
local myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")


--------------------
--  Window Layout --
--------------------

function arrange(app, layout)
  local appLayout = layout[app:title()]
  if appLayout then
    for windowTitle, actions in pairs(appLayout) do
      local window = app:getWindow(windowTitle)
      if window == nil then
        window = app:mainWindow()
      end
      if not window:isStandard() then return end
      for _, action in pairs(actions) do
        action(window)
      end
    end
  end
end

function currentLayout()
  local layout = cfg.singleLayout
  if (#hs.screen.allScreens() > 1) then
    layout = cfg.dualLayout
  end
  return layout
end

function layout()
  for _, app in pairs(hs.application.runningApplications()) do
    arrange(app, currentLayout())
  end
end


----------------------
--  Screen Watcher  --
----------------------

function screenWatcher()
  if cfg.manageBluetooth then
    local blueutil = "/usr/local/bin/blueutil"
    if (#hs.screen.allScreens() == 1) then
      os.execute(blueutil .. " power 0")
    else
      os.execute(blueutil .. " power 1")
    end
  end
  layout()
end
-- screenWatcher = hs.screen.watcher.new(screenWatcher)
-- screenWatcher:start()


------------------
--  Keymapings  --
------------------

hs.hotkey.bind(cfg.mash, 'l', layout)
-- hs.hotkey.bind(cfg.mash, 'r', hs.reload
hs.hotkey.bind(cfg.mash, 'r', function()
                 hs.reload()
                 hs.alert.show("Config reloaded")
end)


layout() -- layout windows after start
