#!/bin/sh
#
pulseaudio -D &
xrandr --output eDP --primary --mode 1920x1080 --output HDMI-A-0 --mode 1920x1080 --rate 75 --above eDP &
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
