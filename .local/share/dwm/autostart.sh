#!/bin/sh

rm -rf /home/iamb4uc/.config/mpdnotify/pid &
pulseaudio -D &
xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1920x1080 --rate 75 --right-of eDP
xset r rate 300 50
setxkbmap -option caps:escape &
slstatus &
setbg &
picom &
syncthing &
mpdnotify start &
mpd &
