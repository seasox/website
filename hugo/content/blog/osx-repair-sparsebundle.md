+++
date = "2016-02-23T17:05:32+01:00"
title = "Repair sparse bundle for Time Machine"

+++

```
sudo -s
cd /Volumes/TimeMachineBackup
chflags -R nouchg atar.sparsebundle
hdiutil attach -nomount -noverify -noautofsck atar.sparsebundle
/dev/disk2           Apple_partition_scheme
/dev/disk2s1         Apple_partition_map
/dev/disk2s2         Apple_HFSX
fsck_hfs -drfy /dev/disk2s2
```
