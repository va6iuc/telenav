#!/bin/bash 
if [ ! -f /dev/sdb1 ];
then
   /usr/bin/echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/sdb
   /usr/bin/mkdir /var/2_gb_disk;
   /usr/sbin/mkfs.ext4 /dev/sdb1;
fi
/usr/bin/grep -q -F '/dev/sdb1               /var/2_gb_disk          ext4    defaults        0 0' /etc/fstab || /usr/bin/echo '/dev/sdb1               /var/2_gb_disk          ext4    defaults        0 0' >> /etc/fstab 
/usr/bin/mount -a
