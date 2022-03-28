hs.window.animationDuration = 0 -- disable animations

function launchOrFocus(app)
  return function()
    hs.application.launchOrFocusByBundleID(app)
  end
end

local bindings = {
  -- Find bundle ID using
  -- osascript -e 'id of app "Google Chrome"'
  [{'alt', 'cmd', 'ctrl', 'shift'}] = {
    b = launchOrFocus('com.brave.Browser'),
    c = launchOrFocus('com.google.Chrome'),
    d = launchOrFocus('com.hnc.Discord'),
    f = launchOrFocus('fom.apple.finder'),
    g = launchOrFocus('ru.keepcoder.Telegram'),
    s = launchOrFocus('com.tinyspeck.slackmacgap'),
    t = launchOrFocus('net.kovidgoyal.kitty'),
    v = launchOrFocus('com.microsoft.VSCode'),
    w = launchOrFocus('Whatsapp'),
    y = launchOrFocus('com.apple.systempreferences'),
    z = launchOrFocus('us.zoom.xos'),
  },
}

for modifier, keyActions in pairs(bindings) do
  for key, action in pairs(keyActions) do
    hs.hotkey.bind(modifier, tostring(key), action)
  end
end

--
-- Auto-reload config on change.
--

function reloadConfig(files)
  for _, file in pairs(files) do
    if file:sub(-4) == '.lua' then
      hs.reload()
    end
  end
end

hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()