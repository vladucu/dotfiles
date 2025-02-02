#!/bin/bash
# narze's config
# Legends
# Leader : Alt
# Navigation : H / J / K / L (vim)
# Prew / Next : < / >
# Move : Leader + Shift
# Resize : Leader + Cmd
# Monitor : I / O
# Desktop : U / P or Leader + Ctrl

# Keycodes
# 0x23 = Colemak semicolon / Qwerty P
# 0x2B = Comma / <
# 0x2F = Fullstop / >
# 0x2C = Slash
# Observe keycode with `skhd -o`


# Sometimes --focus recent does not work, use second yabai.history.txt if fails
alt - 0x27 : yabai -m window --focus recent || yabai -m window --focus "$(tail -n 2 /tmp/yabai.history.txt | head -n 1 | cut -d ' ' -f 1)"
alt - o : yabai -m window --focus smallest

# move window
alt + cmd + shift - n : yabai -m window --warp south
alt + cmd + shift - h : yabai -m window --warp west
alt + cmd + shift - m : yabai -m window --warp west
alt + cmd + shift - e : yabai -m window --warp north
alt + cmd + shift - i : yabai -m window --warp east

# swap window
alt + shift - m : yabai -m window --swap west
alt + shift - n : yabai -m window --swap south
alt + shift - e : yabai -m window --swap north
alt + shift - i : yabai -m window --swap east

# stack window
alt + ctrl + shift - m : yabai -m window --stack west
alt + ctrl + shift - n : yabai -m window --stack south
alt + ctrl + shift - e : yabai -m window --stack north
alt + ctrl + shift - i : yabai -m window --stack east

# Float (migrated to Hammerspoon)
# make floating window fill screen, make it float if not already floating
# ctrl + alt + cmd - t : yabai -m window --toggle float; \
#                        floating=$(yabai -m query --windows --window | jq .floating); \
#                        [ $floating -eq 1 ] && yabai -m window --grid 1:1:0:0:1:1

# # float fill left half, force float if not floating
# ctrl + alt + cmd - h : floating=$(yabai -m query --windows --window | jq .floating); \
#                        [ $floating -eq 0 ] && yabai -m window --toggle float; \
#                        yabai -m window --grid 1:2:0:0:1:1
# ctrl + alt + cmd - m : floating=$(yabai -m query --windows --window | jq .floating); \
#                        [ $floating -eq 0 ] && yabai -m window --toggle float; \
#                        yabai -m window --grid 1:2:0:0:1:1

# # float fill right half, force float if not floating
# ctrl + alt + cmd - i : floating=$(yabai -m query --windows --window | jq .floating); \
#                        [ $floating -eq 0 ] && yabai -m window --toggle float; \
#                        yabai -m window --grid 1:2:1:0:1:1

# # float fill bottom half, force float if not floating
# ctrl + alt + cmd - n : floating=$(yabai -m query --windows --window | jq .floating); \
#                        [ $floating -eq 0 ] && yabai -m window --toggle float; \
#                        yabai -m window --grid 2:1:0:1:1:1

# # float fill top half, force float if not floating
# ctrl + alt + cmd - e : floating=$(yabai -m query --windows --window | jq .floating); \
#                        [ $floating -eq 0 ] && yabai -m window --toggle float; \
#                        yabai -m window --grid 2:1:0:0:1:1

# create desktop
# ctrl + cmd + alt - m : yabai -m space --create;

# create desktop, move window and follow focus
ctrl + alt + cmd - k : yabai -m space --create; \
                       yabai -m window --space last; \
                       yabai -m space --focus last; \
                       yabai -m window --grid 1:1:0:0:1:1

# destroy desktop
ctrl + cmd + alt + shift - w : yabai -m space --focus prev; \
                               yabai -m space next --destroy

# fast focus desktop
alt + ctrl - 0x2B : yabai -m space --focus recent
alt - l : yabai -m space --focus prev || skhd -k "ctrl - left"
# alt + ctrl - h : yabai -m space --focus prev
alt - 0x23 : yabai -m space --focus next || skhd -k "ctrl - right"
# alt + ctrl - i : yabai -m space --focus next

# send window to desktop
alt + ctrl + shift - 0x2B : yabai -m window --space recent
alt + shift - l : yabai -m window --space prev
alt + ctrl + shift - h : yabai -m window --space prev
alt + shift - 0x23 : yabai -m window --space next


# send window to monitor and follow focus
alt + shift - u : yabai -m window --display west; yabai -m display --focus west
alt + shift - y : yabai -m window --display east; yabai -m display --focus east

# increase region size
alt + cmd - a : yabai -m window --resize left:-80:0
alt + cmd - r : yabai -m window --resize bottom:0:80
alt + cmd - w : yabai -m window --resize top:0:-80
alt + cmd - s : yabai -m window --resize right:80:0

# decrease region size
alt + cmd + ctrl - a : yabai -m window --resize left:80:0
alt + cmd + ctrl - r : yabai -m window --resize bottom:0:-80
alt + cmd + ctrl - w : yabai -m window --resize top:0:80
alt + cmd + ctrl - s : yabai -m window --resize right:-80:0

# toggle window zoom
alt - z : yabai -m window --toggle zoom-fullscreen

# float / unfloat window and center on screen
alt - t : yabai -m window --toggle float;\
          yabai -m window --grid 9:16:2:1:12:7 # Rows:Columns:X:Y:W:H

# toggle border
alt - b : yabai -m window --toggle border

# classic pip
alt - p : yabai -m window --toggle float;\
          yabai -m window --toggle sticky;\
          yabai -m window --grid 5:5:3:0:2:2;
          # yabai -m window --layer above;

# toggle sticky, float and resize to picture-in-picture size
alt + shift - p : yabai -m window --toggle sticky;\
                  yabai -m window --toggle pip;
                  # yabai -m window --layer above;

# float next window to be tiled
# shift + alt - t : chunkc set window_float_next 1

# change layout of desktop
ctrl + alt - a : yabai -m space --layout bsp; \
                 terminal-notifier -title Yabai -message "Bsp mode activated"
ctrl + alt - r: yabai -m space --layout float; \
                 terminal-notifier -title Yabai -message "Float mode activated"
ctrl + alt - s : yabai -m space --layout stack; \
                 terminal-notifier -title Yabai -message "Stack mode activated"

# ctrl + alt - l : yabai -m space --deserialize ~/.chunkwm_layout
# ctrl + alt + cmd - l : yabai -m space --serialize ~/.chunkwm_layout

# Fix screenshot taking in app mode
cmd + shift - 4 -> : yabai -m window --toggle border; sleep 3; yabai -m window --toggle border;
ctrl + cmd + shift - 4 -> : yabai -m window --toggle border; sleep 3; yabai -m window --toggle border;

# Reload yabai
ctrl + alt + cmd - z : chezmoi apply ~/.yabairc ~/.skhdrc && \
                       osascript -e 'tell application "Keyboard Maestro Engine" to do script "Hide All Windows"' && \
                       launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai" && \
                       sleep 5 && \
                       hs -c "hs.reload()"

# Quick reload yabai
ctrl + cmd - z : chezmoi apply ~/.yabairc ~/.skhdrc && \
                 launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"

# Float everything in screen except current window
ctrl + alt + cmd - x : ids=$(yabai -m query --windows --space | jq -r ".[] | select(.floating == 0) | .id") && \
                        while IFS= read -r id; do \
                          yabai -m window $id --toggle float; \
                        done <<< "$ids" && \
                        ids=$(yabai -m query --windows --space | jq -r ".[] | select(.floating == 1) | .id") && \
                        while IFS= read -r id; do \
                          yabai -m window $id --grid 9:16:2:1:12:7; \
                        done <<< "$ids" && \

# Unfloat
ctrl + alt + cmd - c : ids=$(yabai -m query --windows --space | jq -r ".[] | select(.floating == 1) | .id") && \
                        while IFS= read -r id; do \
                          yabai -m window $id --toggle float ; \
                        done <<< "$ids"

# Balance windows
alt - 0x2C : yabai -m space --balance

# Toggle space windows gap
alt - d : yabai -m space --toggle gap

# Toggle space windows padding
alt - g : yabai -m space --toggle padding

# Task randomizer
ctrl + alt + cmd + shift - d : osascript ~/Library/Scripts/omnifocus-task-randomizer.applescript

# Hyper 1-0
ctrl + alt + cmd + shift - 1 : /Applications/Microsoft\ Edge.app/Contents/MacOS/Microsoft\ Edge

# Opacity toggle
# alt - o : opacity=$(yabai -m query --windows --window | jq .opacity); \
#           [ $opacity -eq 1 ] && yabai -m window --opacity 0.85 || yabai -m window --opacity 1.0

# Move window to mouse
alt + shift - j : space=$(yabai -m query --spaces --space mouse | jq .index); \
                  yabai -m window --space "$space"; \
                  yabai -m space --focus "$space";

# Swap window with the largest window on screen, if already largest, swap with recent window and focus largest window again
alt - tab : ~/.yabai.swap-largest.sh

# Adjust split ratio with alt + equal and alt + minus
alt + cmd - 0x18 : yabai -m config split_ratio $(bc -l <<< "$(yabai -m config split_ratio) + 0.025"); yabai -m space --equalize;
alt + cmd - 0x1B : yabai -m config split_ratio $(bc -l <<< "$(yabai -m config split_ratio) - 0.025"); yabai -m space --equalize;
alt + cmd - 0 : yabai -m config split_ratio 0.618; yabai -m space --equalize;