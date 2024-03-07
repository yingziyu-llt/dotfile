#! /bin/sh
#
# sleep.sh
# Copyright (C) 2024 Letian Lin <yingziyu-Lin@outlook.com>
#
# Distributed under terms of the GNU AGPLv3+ license.
#
#based on ArchWiki

swayidle -w timeout 300 'hyprlock' \
	timeout 600 'hyprctl dispatch dpms off' \
	resume 'hyprctl dispatch dpms on' \
	timeout 900 'systemctl suspend' \
	before-sleep 'hyprlock' &
