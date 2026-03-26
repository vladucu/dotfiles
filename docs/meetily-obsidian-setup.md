# Meetily → Obsidian Meeting Transcription Pipeline

Fully local meeting transcription with speaker diarization, AI summaries, and automatic sync to Obsidian.

## Overview

```
┌─────────────────────────────────────────────────────────────────┐
│  Google Meet (Arc / Chrome)                                     │
│  You join a meeting                                             │
└──────────────┬──────────────────────────────────────────────────┘
               │ Hammerspoon detects meet.google.com tab (10s poll)
               ▼
┌─────────────────────────────────────────────────────────────────┐
│  Meetily (auto-launched)                                        │
│  • Records system audio + mic                                   │
│  • Transcribes with Parakeet/Whisper (local, on-device)         │
│  • Speaker diarization (identifies who said what)               │
│  • Auto-generates summary when recording stops (Gemma 3 4B)    │
│  • Stores everything in SQLite                                  │
└──────────────┬──────────────────────────────────────────────────┘
               │ Run sync script (manual or automated)
               ▼
┌─────────────────────────────────────────────────────────────────┐
│  Obsidian Vault (brain/meetings/)                               │
│  • Markdown files with frontmatter                              │
│  • Summary + action items + key points at top                   │
│  • Full transcript in collapsible <details> block               │
│  • Optionally re-summarized via `claude -p` (subscription)      │
│  • Git-committed to vault                                       │
└─────────────────────────────────────────────────────────────────┘
```

## Components

### 1. Meetily (Transcription + Summarization)

- **App**: `/Applications/meetily.app` (v0.3.0)
- **Source**: [Zackriya-Solutions/meetily](https://github.com/Zackriya-Solutions/meetily) — 10.7K ★
- **Database**: `~/Library/Application Support/com.meetily.ai/meeting_minutes.db`
- **Engine**: Parakeet (4× faster than Whisper) or Whisper
- **Built-in summarization**: Gemma 3 4B (offline, ~3.5GB RAM) or Claude/Ollama/OpenAI/Groq/OpenRouter
- **Privacy**: 100% local transcription — no audio leaves the Mac

#### Recommended Settings

| Setting | Value | Why |
|---------|-------|-----|
| **Auto Summary** | ✅ ON | Generates summary automatically when you stop recording |
| **Summarization Model** | Built-in AI (Gemma 3 4B) | Good quality, no API needed |
| **Transcription Engine** | Parakeet | Faster than Whisper on Apple Silicon |

To change summarization model: Settings → Summary → pick from Built-in AI, Claude, Ollama, OpenAI, Groq, OpenRouter, or Custom Server (OpenAI-compatible).

### 2. Hammerspoon (Auto-Detection)

- **Config**: `~/.hammerspoon/meetily-auto.lua`
- **What it does**: Polls Arc and Chrome tabs every 10 seconds for `meet.google.com` URLs
- **On meeting join**: Launches Meetily + shows notification to hit Record
- **On meeting leave**: Shows notification to stop recording and sync
- **Toggle**: `Hyper+R` (`⌥⌘⌃⇧+R`) to enable/disable the watcher

#### Hammerspoon setup

In `~/.hammerspoon/init.lua`:
```lua
local meetily = require("meetily-auto")
meetily.start()
hs.hotkey.bind({'alt', 'cmd', 'ctrl', 'shift'}, 'r', meetily.toggle)
```

The full watcher module lives at `~/.hammerspoon/meetily-auto.lua`. It checks both Arc and Chrome via AppleScript tab enumeration.

### 3. Sync Script (Meetily → Obsidian)

- **Script**: [`scripts/meetily-to-obsidian.sh`](../scripts/meetily-to-obsidian.sh)
- **Output**: `~/code/github.com/vladucu/brain/meetings/<date>-<title>.md`

#### Usage

```bash
# Sync new meetings since last sync
./scripts/meetily-to-obsidian.sh

# Re-sync all meetings
./scripts/meetily-to-obsidian.sh --all

# Sync + summarize each transcript via Claude CLI (uses your subscription)
./scripts/meetily-to-obsidian.sh --summarize

# Sync + summarize + auto-commit to vault
./scripts/meetily-to-obsidian.sh --summarize --commit

# Preview without writing
./scripts/meetily-to-obsidian.sh --dry-run
```

#### Summarization via Claude CLI

When `--summarize` is passed, the script pipes each transcript through `claude -p` using your Claude subscription (no API key needed). This produces higher-quality structured summaries than Meetily's built-in Gemma 3 4B.

The summarization:
- Uses `claude -p --model sonnet --bare --no-session-persistence`
- Produces: Summary, Key Decisions, Action Items, Key Discussion Points, Follow-ups
- Attributes action items to speakers where identifiable
- Falls back to Meetily's built-in summary if Claude is unavailable
- Override model with `CLAUDE_MODEL=opus ./scripts/meetily-to-obsidian.sh --summarize`

#### Output Format

Each meeting becomes a markdown file in `brain/meetings/`:

```markdown
---
type: meeting
created: 2026-03-27T14:00:00
updated: 2026-03-27T14:45:00
meetily_id: "abc123"
source: meetily
status: summarized
---
# Weekly Engineering Standup

**Date**: 2026-03-27

## Summary
Concise overview of what was discussed and decided.

## Key Decisions
- Decision 1
- Decision 2

## Action Items
- [ ] Action item with owner
- [ ] Another action item

## Key Discussion Points
- Topic discussed with context

## Follow-ups
- Things to revisit

## Transcript
<details>
<summary>Full transcript (click to expand)</summary>

Speaker 1: ...
Speaker 2: ...

</details>
```

## Daily Workflow

### During a meeting
1. Join Google Meet in Arc/Chrome
2. Hammerspoon auto-launches Meetily → notification appears
3. **Click Record** in Meetily (one manual step — PRO has auto-record)
4. Meeting happens — Meetily transcribes in real-time with speaker labels
5. **Click Stop** when meeting ends
6. Meetily auto-generates summary if Auto Summary is enabled

### After a meeting
```bash
# Sync + summarize via Claude + commit to vault
./scripts/meetily-to-obsidian.sh --summarize --commit

# Or use the alias (add to .zshrc):
alias meeting-sync="~/code/github.com/vladucu/agent-config/scripts/meetily-to-obsidian.sh --summarize --commit"
```

### In Obsidian
- Browse `meetings/` folder for all synced transcripts
- Summary, action items, and key points are at the top
- Full transcript is in a collapsible block
- Add your own notes, link to projects, tag attendees

## File Locations

| Component | Path |
|-----------|------|
| Meetily app | `/Applications/meetily.app` |
| Meetily database | `~/Library/Application Support/com.meetily.ai/meeting_minutes.db` |
| Hammerspoon watcher | `~/.hammerspoon/meetily-auto.lua` |
| Hammerspoon init | `~/.hammerspoon/init.lua` |
| Sync script | `scripts/meetily-to-obsidian.sh` (this repo) |
| Setup guide | `docs/meetily-obsidian-setup.md` (this file) |
| Meeting notes output | `~/code/github.com/vladucu/brain/meetings/` |
| Sync marker | `~/code/github.com/vladucu/brain/meetings/.last-sync` |

## Troubleshooting

### Meetily not launching on Google Meet
- Check Hammerspoon is running (menu bar icon)
- Verify watcher is active: open Hammerspoon console → `meetily.status()`
- Toggle with `Hyper+R`
- Ensure Arc/Chrome allows AppleScript: System Settings → Privacy → Automation

### No transcript in sync
- Make sure Meetily has microphone + screen recording permissions
- System Settings → Privacy & Security → Microphone → meetily ✅
- System Settings → Privacy & Security → Screen & System Audio Recording → meetily ✅

### Summary missing
- Enable Auto Summary in Meetily: Settings → Summary → toggle ON
- Or use `--summarize` flag to summarize via Claude during sync
- Or manually generate: click the summary button in Meetily after recording

### Sync script can't find database
- Run Meetily at least once to create the database
- Check: `ls ~/Library/Application\ Support/com.meetily.ai/`
- Override with: `MEETILY_DB=/path/to/db ./scripts/meetily-to-obsidian.sh`

### Claude summarization fails
- Ensure `claude` CLI is installed and authenticated
- Test with: `echo "test" | claude -p --bare "summarize this"`
- Override model: `CLAUDE_MODEL=haiku ./scripts/meetily-to-obsidian.sh --summarize`

## Future Improvements

- [ ] Auto-run sync script when Meetily recording stops (via fswatch on the DB)
- [ ] Add speaker name mapping (Speaker 1 → "Vlad", Speaker 2 → "Alice")
- [ ] Obsidian template for meeting notes with attendee wikilinks
- [ ] Evaluate Meetily PRO for auto-record + auto-meeting detection
