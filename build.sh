#!/bin/bash

sudo rsync -aAXv /media/user/lfs /media/user/ext-ssd/lfs \
  --exclude={"/proc/*","/sys/*","/dev/*","/run/*","/tmp/*","/mnt/*","/media/*","/lost+found"}

sudo mksquashfs /media/user/ext-ssd/lfs /media/filesystem.squashfs -comp xz -e boot

sudo cp -v /media/filesystem.squashfs ~/simple-live-iso/filesystem.squashfs
sudo cp /media/user/lfs/boot/vmlinuz-$(uname -r) ~/simple-live-iso/vmlinuz
sudo cp /media/user/lfs/boot/initrd.img-$(uname -r) ~/simple-live-iso/initramfs

sudo ~/simple-live-iso/boot.sh

sudo grub-mkrescue -o /media/user/ext-ssd/lfs/live-os.iso ~/simple-live-iso
