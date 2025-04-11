#!/bin/bash

cat <<EOF | sudo tee ~/simple-live-iso/boot/grub/grub.cfg
set default=0
set timeout=5

menuentry "Linux Live OS" {
    linux /vmlinuz boot=live toram persistence findiso=filesystem.squashfs
    initrd /initramfs
}
EOF
