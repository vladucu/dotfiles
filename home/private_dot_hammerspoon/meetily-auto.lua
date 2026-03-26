-- meetily-auto.lua — Auto-launch Meetily when joining Google Meet
--
-- Polls browser tabs for meet.google.com URLs.
-- When detected: launches Meetily and shows a reminder to hit Record.
-- When the meeting ends: shows a notification to stop recording.

local M = {}

-- ─── Config ────────────────────────────────────────────────────────────────
M.pollInterval = 10          -- seconds between checks
M.bundleId = "com.meetily.ai"
M.meetPattern = "meet.google.com/"
M.enabled = true

-- ─── State ─────────────────────────────────────────────────────────────────
local timer = nil
local inMeeting = false
local meetilyLaunched = false

-- ─── Browser tab helpers ───────────────────────────────────────────────────

-- Check if any tab in Arc matches a URL pattern
local function arcHasMeetTab()
  local ok, result = hs.osascript.applescript([[
    tell application "System Events"
      if not (exists process "Arc") then return "no"
    end tell
    tell application "Arc"
      set tabURLs to {}
      repeat with w in every window
        repeat with t in every tab of w
          set end of tabURLs to URL of t
        end repeat
      end repeat
      set AppleScript's text item delimiters to "|||"
      return tabURLs as text
    end tell
  ]])
  if ok and result then
    return string.find(result, M.meetPattern, 1, true) ~= nil
  end
  return false
end

-- Check if any tab in Chrome matches a URL pattern
local function chromeHasMeetTab()
  local ok, result = hs.osascript.applescript([[
    tell application "System Events"
      if not (exists process "Google Chrome") then return "no"
    end tell
    tell application "Google Chrome"
      set tabURLs to {}
      repeat with w in every window
        repeat with t in every tab of w
          set end of tabURLs to URL of t
        end repeat
      end repeat
      set AppleScript's text item delimiters to "|||"
      return tabURLs as text
    end tell
  ]])
  if ok and result then
    return string.find(result, M.meetPattern, 1, true) ~= nil
  end
  return false
end

local function isInGoogleMeet()
  return arcHasMeetTab() or chromeHasMeetTab()
end

-- ─── Core logic ────────────────────────────────────────────────────────────

local function checkMeeting()
  if not M.enabled then return end

  local meetDetected = isInGoogleMeet()

  if meetDetected and not inMeeting then
    -- Meeting started
    inMeeting = true

    local meetily = hs.application.get(M.bundleId)
    if not meetily then
      hs.application.launchOrFocusByBundleID(M.bundleId)
      meetilyLaunched = true
      hs.notify.new({
        title = "🎙️ Meetily",
        informativeText = "Google Meet detected — Meetily launched.\nHit Record to start transcribing!",
        withdrawAfter = 10,
      }):send()
    else
      hs.notify.new({
        title = "🎙️ Meetily",
        informativeText = "Google Meet detected — Meetily is running.\nMake sure recording is active!",
        withdrawAfter = 8,
      }):send()
    end

    hs.printf("[meetily-auto] Google Meet detected → launched Meetily")

  elseif not meetDetected and inMeeting then
    -- Meeting ended
    inMeeting = false
    meetilyLaunched = false

    hs.notify.new({
      title = "🎙️ Meetily",
      informativeText = "Google Meet ended.\nDon't forget to stop recording and sync to Obsidian!",
      withdrawAfter = 15,
    }):send()

    hs.printf("[meetily-auto] Google Meet ended → reminded to stop recording")
  end
end

-- ─── Public API ────────────────────────────────────────────────────────────

function M.start()
  M.enabled = true
  if timer then timer:stop() end
  timer = hs.timer.doEvery(M.pollInterval, checkMeeting)
  hs.printf("[meetily-auto] Watcher started (polling every %ds)", M.pollInterval)
end

function M.stop()
  M.enabled = false
  if timer then timer:stop() end
  inMeeting = false
  hs.printf("[meetily-auto] Watcher stopped")
end

function M.toggle()
  if M.enabled then
    M.stop()
    hs.notify.new({title = "Meetily Auto", informativeText = "Watcher disabled"}):send()
  else
    M.start()
    hs.notify.new({title = "Meetily Auto", informativeText = "Watcher enabled"}):send()
  end
end

function M.status()
  hs.printf("[meetily-auto] enabled=%s inMeeting=%s", tostring(M.enabled), tostring(inMeeting))
end

return M
