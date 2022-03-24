hs.window.animationDuration = 0 -- disable animations

function launchOrFocus(app)
  return function()
    hs.application.launchOrFocus(app)
  end
end

local bindings = {
  [{'alt', 'cmd', 'ctrl', 'shift'}] = {
    c = launchOrFocus('Brave'),
    c = launchOrFocus('Google Chrome'),
    d = launchOrFocus('Discord'),
    f = launchOrFocus('Finder'),
    g = launchOrFocus('Telegram'),
    s = launchOrFocus('Slack'),
    t = launchOrFocus('kitty'),
    v = launchOrFocus('Visual Studio Code'),
    w = launchOrFocus('WhatsApp'),
    y = launchOrFocus('System Preferences'),
    z = launchOrFocus('zoom.us'),
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