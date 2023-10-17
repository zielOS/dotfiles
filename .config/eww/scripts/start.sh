#!/bin/bash
pkill eww
eww daemon
~/.config/eww/scripts/notifications.py &
