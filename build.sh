#!/bin/bash

sudo rsync -aAXv /media/user/lfs /media/user/ext-ssd/lfs \
  --exclude={"/proc/*","/sys/*","/dev/*","/run/*","/tmp/*","/mnt/*","/media/*","/lost+found"}

sudo mksquashfs /media/user/ext-ssd/lfs /media/filesystem.squashfs -comp xz -e boot

sudo cp -v /media/filesystem.squashfs ~/simple-live-iso/filesystem.squashfs
sudo cp -v /media/user/lfs/boot/vmlinuz-$(uname -r) ~/simple-live-iso/vmlinuz
sudo cp -v /media/user/lfs/boot/initrd.img-$(uname -r) ~/simple-live-iso/initrd

sudo ~/simple-live-iso/boot.sh

sudo grub-mkrescue ~/simple-live-iso -o /media/user/ext-ssd/linux-live.iso
