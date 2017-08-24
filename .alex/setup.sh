#!/bin/bash

sudo cp ~/.alex/hid_apple.conf /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u

gsettings set com.canonical.indicator.datetime custom-time-format "'%Y-%m-%d %H:%M:%S %a'"
gsettings set com.canonical.indicator.datetime time-format "'custom'"
