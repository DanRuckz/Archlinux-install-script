#!/bin/bash

echo "This is a uefi installation on a gpt drive..."
echo "which disk to install into?
fdisk -l |grep /dev |awk '{print $2}' | sed 's/.$//' |grep -v -e loop -e sr
read DISK 
SIZE=`fdisk -l "$DISK" |grep GiB |awk '{print $3}'`
echo "g\nn\np\n1\n\n+1G\nn\np\n\n\n+4G\nn\np\n\n\n+40G\nn\np\n\n\n\n |fdisk $DISK"
mkfs.fat -F32 "$DISK1" && mkswap "$DISK2" && mkfs.ext4 "DISK3" && mkfs.ext4 "DISK4"
mount "$DISK3" /mnt && mkdir /mnt/boot && mkdir /mnt/home && mount "$DISK1" /mnt/boot && mount "$DISK4" /mnt/home && swapon
