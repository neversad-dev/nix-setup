#!/bin/bash

sketchybar --add event aerospace_workspace_change

for m in $(/opt/homebrew/bin/aerospace list-monitors | awk '{print $1}'); do
  for i in $(/opt/homebrew/bin/aerospace list-workspaces --monitor $m); do
    sid=$i
    SPACE=(
      space="$sid"
      icon="$sid:"
      display=$m
      padding_left=0
      padding_right=0
      icon.padding_left=8
      icon.padding_right=0
      icon.color=$DARK_WHITE
      icon.highlight_color=$LAVENDER
      icon.font="$FONT:Bold:14.0"
      label.padding_right=10
      label.color=$DARK_WHITE
      label.highlight_color=$LAVENDER
      label.font="sketchybar-app-font:Regular:16.0"
      background.border_width=0
      background.border_color=$LAVENDER
      background.padding_left=0
      background.padding_right=0
      click_script="/opt/homebrew/bin/aerospace workspace $sid"
    )
    

    sketchybar  --add space space.$sid left             \
                --set space.$sid "${SPACE[@]}" 

    apps=$(/opt/homebrew/bin/aerospace list-windows --workspace $sid | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
    
    icon_strip=""
    if [ "${apps}" != "" ]; then
      while read -r app
      do
        icon_strip+="$($PLUGIN_DIR/icon_map_fn.sh "$app")"
      done <<< "${apps}"
    else
      icon_strip="—"
    fi

    sketchybar --set space.$sid label="$icon_strip"
  done

  for i in $(/opt/homebrew/bin/aerospace list-workspaces --monitor $m --empty); do
    sketchybar --set space.$i display=0
  done
done

SPACES=(
  background.color=$BG_SEC_COLR
  background.corner_radius=10
  background.drawing=on
  script="$PLUGIN_DIR/space.sh"
)

sketchybar  --add bracket spaces '/space\..*/'          \
            --set spaces "${SPACES[@]}"


SELECTED=(
    background.border_width=1
    label.highlight=on
    icon.highlight=on
)

selected=$(/opt/homebrew/bin/aerospace list-workspaces --focused)

sketchybar --set space.$selected "${SELECTED[@]}" 




SPACE_SEPARATOR=(
  icon=􀆊
  padding_left=0
  padding_right=0
  display=active
  icon.font="$FONT:Heavy:16.0"
  icon.padding_left=6
  icon.padding_right=8
  label.drawing=off
  icon.color=$WHITE
)

sketchybar  --add item space_separator left                             \
            --set space_separator "${SPACE_SEPARATOR[@]}"  

sketchybar  --add item aerospace_listener center                        \
            --set aerospace_listener drawing=off                        \
            --set aerospace_listener script="$PLUGIN_DIR/spaces.sh"     \
            --subscribe aerospace_listener aerospace_workspace_change front_app_switched

