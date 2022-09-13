#!/bin/sh


pulseaudio -D &
lxpolkit &
xrandr --output eDP --mode 1920x1080 --output HDMI-A-0 --mode 1920x1080 --rate 75 --above eDP &
xset r rate 300 50
nitrogen --restore &
setxkbmap -option caps:escape &
slstatus &
picom &
