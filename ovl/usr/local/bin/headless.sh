#!/bin/sh

# Setup networking
apk add wpa_supplicant
service wpa_supplicant start
service networking start
rm /var/run/ifstate

# Setup SSH
/sbin/setup-sshd -c openssh
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig
cat <<EOF >> /etc/ssh/sshd_config
PermitEmptyPasswords yes
PermitRootLogin yes
EOF
service sshd restart
mv /etc/ssh/sshd_config.orig /etc/ssh/sshd_config

# Simulate a daemon
sleep infinity
