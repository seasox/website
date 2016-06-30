+++
date = "2016-02-22T22:15:40+01:00"
title = "Restore Mac OS X 10.11 El Capitan from Time Machine backup on AFP"

+++

I recently had difficulties restoring a Time Machine backup which is stored on a netatalk server to a MacBook Pro using the builtin Recovery Mode. 

```
mkdir /Volumes/backup
mount_afp afp://user:pwd@example.org/afpShareName /Volumes/backup
hdid /Volumes/backup/$SPARSBUNDLENAME
```

This fixes the issue. :-)
