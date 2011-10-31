#!/bin/sh
#
# Adam Lloyd <adam@alloy-d.net>
# 
# Simple script to toggle between Colemak and QWERTY.
#
# The T61p setup should be sufficient for most machines, but some (like
# the Cr-48) put the key that Colemak uses for backspace in different
# places.

ACTION=${1-help}
HOST=`hostname | cut -d'.' -f 1`

case "$ACTION" in
    on)
        setxkbmap us -variant colemak
        xset r rate 255
        case "$HOST" in
            nagato)         # ThinkPad T61p
                xset r 66
                ;;
            velaciela)      # Cr-48
                xset r 66
                xset r 133
                xmodmap -e "keycode 133 = BackSpace"
                xmodmap -e "clear Mod4"
                ;;
        esac
        ;;
    off)
        setxkbmap us
        ;;
    help)
        echo "Usage: colemak.sh on|off"
        ;;
esac

