#! /bin/bash
#
# swaylock.sh
# Copyright (C) 2021 Woshiluo Luo <woshiluo.luo@outlook.com>
#
# Distributed under terms of the GNU AGPLv3+ license.
#

wallpaper="~/.config/hypr/wallpapers/night.jpg"

if [ "$1" = 1 ]; then
	#	swayidle -w \
	#		timeout 5 'hyprctl dispatch dpms off' \
	#		resume 'hyprctl dispatch dpms on' &

	swaylock --clock --indicator --screenshots --effect-scale 0.4 --effect-vignette 0.2:0.5 --effect-blur 4x2 --datestr "%a %e.%m.%Y" --timestr "%k:%M"
	kill %%
else
	swaylock --clock --indicator --screenshots --effect-scale 0.4 --effect-vignette 0.2:0.5 --effect-blur 4x2 --datestr "%a %e.%m.%Y" --timestr "%k:%M"
fi
