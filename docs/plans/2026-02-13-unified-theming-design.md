# Unified Theming Across CLI Tools

**Date:** 2026-02-13
**Status:** Approved

## Goal

Add a single `theme` config option in chezmoi that propagates a cohesive color
theme to all CLI tools that support named themes.

## Iteration 1 (this design)

Tools: **Ghostty, delta (git pager), bat, fzf**

### Supported Themes

| Slug | Ghostty | Delta/Bat | FZF |
|------|---------|-----------|-----|
| `dracula` | `Dracula` | `Dracula` | custom `--color` |
| `one-half-dark` | `One Half Dark` | `OneHalfDark` | custom `--color` |
| `snazzy` | `Snazzy` | `Sublime Snazzy` | custom `--color` |
| `catppuccin-mocha` | `Catppuccin Mocha` | `Catppuccin Mocha` | custom `--color` |

**Default:** `dracula` (bat already uses it, FZF Dracula colors already exist in zshrc)

### Iteration 2 (future)

- Neovim colorscheme
- tmux theme (e.g. catppuccin/tmux plugin)

## Implementation

### 1. Chezmoi data variable

**File:** `home/.chezmoi.toml.tmpl`

Add `theme` to the data section with an interactive prompt offering the four
options. Default: `dracula`.

```toml
[data]
theme = "dracula"
```

### 2. Ghostty config

**File:** `home/private_dot_config/ghostty/config` → rename to `config.tmpl`

Add theme mapping at the top and set the `theme` directive:

```
{{- $ghosttyThemes := dict "dracula" "Dracula" "one-half-dark" "One Half Dark" "snazzy" "Snazzy" "catppuccin-mocha" "Catppuccin Mocha" }}
theme = {{ get $ghosttyThemes .theme }}
```

### 3. Delta (git pager)

**File:** `home/private_dot_config/git/config.tmpl`

Add `syntax-theme` to the existing `[delta]` section:

```
{{- $deltaThemes := dict "dracula" "Dracula" "one-half-dark" "OneHalfDark" "snazzy" "Sublime Snazzy" "catppuccin-mocha" "Catppuccin Mocha" }}

[delta]
    navigate = true
    side-by-side = true
    syntax-theme = {{ get $deltaThemes .theme }}
```

### 4. Bat

**File:** New: `home/private_dot_config/bat/config.tmpl`

Bring the existing `~/.config/bat/config` under chezmoi management. Replace the
hardcoded `--theme="Dracula"` with a template:

```
{{- $batThemes := dict "dracula" "Dracula" "one-half-dark" "OneHalfDark" "snazzy" "Sublime Snazzy" "catppuccin-mocha" "Catppuccin Mocha" }}
--theme="{{ get $batThemes .theme }}"
```

Note: bat and delta share the same theme engine (syntect/bat themes), so the
theme names are identical.

### 5. FZF

**File:** `home/dot_zshrc.tmpl`

Replace the commented-out FZF block with a templated version. Each theme has
a pre-defined `--color` string derived from its official palette:

```bash
# Dracula
--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9,fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9,info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6,marker:#ff79c6,spinner:#ffb86c,header:#6272a4

# One Half Dark
--color=fg:#dcdfe4,bg:#282c34,hl:#61afef,fg+:#dcdfe4,bg+:#3e4452,hl+:#61afef,info:#e5c07b,prompt:#98c379,pointer:#c678dd,marker:#c678dd,spinner:#e5c07b,header:#56b6c2

# Snazzy
--color=fg:#eff0eb,bg:#282a36,hl:#57c7ff,fg+:#eff0eb,bg+:#43454f,hl+:#57c7ff,info:#f3f99d,prompt:#5af78e,pointer:#ff6ac1,marker:#ff6ac1,spinner:#f3f99d,header:#9aedfe

# Catppuccin Mocha
--color=fg:#cdd6f4,bg:#1e1e2e,hl:#f38ba8,fg+:#cdd6f4,bg+:#313244,hl+:#f38ba8,info:#cba6f7,prompt:#a6e3a1,pointer:#f5e0dc,marker:#b4befe,spinner:#f5e0dc,header:#94e2d5
```

The FZF config block also enables the general options (height, layout, border,
keybindings) that are currently commented out.

## Files Changed

| File | Action |
|------|--------|
| `home/.chezmoi.toml.tmpl` | Add `theme` variable + prompt |
| `home/private_dot_config/ghostty/config` | Rename to `.tmpl`, add theme directive |
| `home/private_dot_config/git/config.tmpl` | Add `syntax-theme` to `[delta]` |
| `home/private_dot_config/bat/config.tmpl` | New — bring under chezmoi management |
| `home/dot_zshrc.tmpl` | Uncomment + template FZF `--color` block |

## Not In Scope

- **Kitty / Alacritty** — use hardcoded hex colors, not theme names. Would need
  maintaining 4 × 30-line color palettes. Not worth it since Ghostty is primary.
- **Neovim / tmux** — deferred to iteration 2.
- **Theme switching mechanism** — changing theme requires `chezmoi init` to
  re-prompt or manual edit of `~/.config/chezmoi/chezmoi.toml`. This is fine
  since theme changes are infrequent.
