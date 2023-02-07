#!/bin/bash
set -e

symbols=/usr/share/X11/xkb/symbols
rules=/usr/share/X11/xkb/rules

sudo cp -i $symbols/fi $symbols/fi.bk
sudo cp -i fi $symbols/fi

sudo cp -i $rules/evdev.xml $rules/evdev.xml.bk
sudo cp -i evdev.xml $rules/evdev.xml
