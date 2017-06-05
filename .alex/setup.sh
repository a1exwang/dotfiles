#!/bin/bash

sudo cp ~/.alex/hid_apple.conf /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u
