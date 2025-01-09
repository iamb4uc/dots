#!/bin/sh
#
pulseaudio -D &
xrandr --output HDMI-A-0 --primary --mode 1920x1080 --rate 75 --output eDP --mode 1920x1080 --rate 60 --same-as HDMI-A-0 &
xset r rate 250 60 &
setxkbmap -option caps:escape &
slstatus &
# setbg /home/iamb4uc/Pictures/wallpapers &
setbg &
picom &
syncthing &
mpd &
# redshift &
# mpv /home/iamb4uc/Git/dots/music/intro1.mp3
