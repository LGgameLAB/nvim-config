, notify-send -i computer "Welcome" "Looking to customize your desktop? Check out our <b>docs</b>" --action "docs" --action "contact us"

if [[ $? -eq 0 ]]; then
  xdg-open https://https://bestdocs.ocf.io/user-docs/desktop-customization/
fi
