#!/bin/sh
#
killall redshift &

pulseaudio -D &
xrandr --output eDP --primary --mode 1920x1080 --output HDMI-A-0 --mode 1920x1080 --rate 75 --same-as eDP &
xset r rate 250 60 &
setxkbmap -option caps:escape &
slstatus &
setbg &
picom &
syncthing &
redshift &
mpd &
