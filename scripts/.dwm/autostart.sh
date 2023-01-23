#!/bin/sh

# Kills some programs
#
killall pulseaudio
killall lxpolkit
killall slstatus
killall picom
killall redshift


# Startup Programs
#
pulseaudio -D &
lxpolkit &
xrandr --output eDP --mode 1920x1080 --output HDMI-A-0 --mode 1920x1080 --rate 75 --right-of eDP &
xset r rate 300 50
setxkbmap -option caps:escape &
slstatus &
setbg &
picom &
syncthing &
redshift &
mpd &
