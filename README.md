# Alpine headless

> Look Ma, no keyboard, no screen!

This is an overlay for [Alpine Linux](https://alpinelinux.org/) to enable headless installation on Raspberry Pi. There was some [previous effort](https://wiki.alpinelinux.org/wiki/Raspberry_Pi_-_Headless_Installation) to achieve this purpose, but the proposed solution felt a bit hacky. So here is a cleaner way.

At the time of writing, the `af_packet` kernel module is missing in the initramfs. There are a couple of [related](https://gitlab.alpinelinux.org/alpine/aports/issues/10750) [issues](https://gitlab.alpinelinux.org/alpine/aports/issues/6516) and even a [fix](https://gitlab.alpinelinux.org/alpine/aports/commit/081f8a1b130ed1c3cfae5317fc6bbb79b5905fd5), but it does not seem to have found its way into a recent release. If you are using Alpine in diskless mode, DHCP will not work, and you will need to provide a static IP address.

Tested on a Raspberry Pi 2B.

## Configuration

Edit `etc/network/interfaces` and/or `etc/network/wpa_supplicant/wpa_supplicant.conf` to match your needs.

## Installation

Build the overlay with `./make.sh` and just copy the resulting tarball at the root of your SD card.

Login via SSH with user `root` and no password, and run `setup-alpine` as usual.