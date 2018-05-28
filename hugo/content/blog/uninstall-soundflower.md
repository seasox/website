+++
date = "2018-05-28T11:21:44+02:00"
draft = false
title = "Uninstall Soundflower"

+++

Soundflower comes with an `Uninstall Soundflower.scpt` file. Yeah, [AppleScript](https://en.wikipedia.org/wiki/Pile_of_Poo_emoji) sucks, so this is what it does:

<pre>
sudo rm -rf /System/Library/Extensions/Soundflower.kext
sudo rm -rf /Library/Extensions/Soundflower.kext
sudo rm -rf /Library/Receipts/Soundflower*
sudo rm -rf /var/db/receipts/com.cycling74.soundflower.*
sudo rm -rf /Applications/Soundflower
</pre>


kkthxbye
