#!/bin/sh

# Kills some programs
#
killall pulseaudio
killall mpd
killall slstatus
killall picom
killall redshift
killall syncthing
killall lf


# Startup Programs
#
pulseaudio -D &
# xrandr --output eDP --mode 1920x1080 --pos 0x586 --rotate normal --output HDMI-A-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DisplayPort-0 --off
# xrandr --output eDP --off --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-0 --off
xrandr --output eDP --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DisplayPort-0 --off
xset r rate 300 50
setxkbmap -option caps:escape &
slstatus &
setbg &
picom &
syncthing &
redshift &
mpd &
