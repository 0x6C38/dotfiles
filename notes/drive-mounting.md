# Media drive mounting
Look for the drive's UUID via lsblk and then mount the drive to some location (which must exist) and then create an entry in the /etc/fstab file using noatime. This line should work by replacing sdb1 with the name of the drive and /run/media/dsalvio/Media with the desired mount point.

    echo "UUID=$(lsblk -no UUID /dev/sdb1) /run/media/dsalvio/Media $(lsblk -no FSTYPE /dev/sdb1) defaults,noatime 0 2" >> /etc/fstab 

Make sure ntfs-3g is installed since linux struggles with some ntfs variations.

By default root may take ownership of the mounted folder so it may be necessary to take measures to provide other users with access. This may be done via configuration in the fstab file or by taking ownership of the mounted drive:

    sudo chown -R myUserName: /media/MD

It's possible that the media drive may be set to read only because of windows. If that's the case, switch to windows and disable hibernation as well as fast start up.
