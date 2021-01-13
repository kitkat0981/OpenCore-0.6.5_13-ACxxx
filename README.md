# OpenCore-0.6.5_13-ACxxx MacOS BigSur 11.1

My Setup is:

* Dualboot Windows and MacOS BigSur 11.1
* HP Spctre x360 model 13-AC010CA
* i5-7200 Kaby Lake 7th gen
* 8gb RAM
* Intel HD620
* Intel AC8265
* Realtek ALC295

This is my setup for my laptop. Everything seems to be working although cannot boot straight from EFI partition on M.2 Getting error AAPL: #[EB|LOG:EXITBS:START] and nothing on Dortania's Troubleshooting guide seems to work. If you find something that works please let me know.

What is working:
* iMessage
* Facetime
* Wifi (using Airportitlwm kext)
* Bluetooth mouse (using I2C kext with a Microsoft Scuplt Comfort mouse, unsure about other Bluetooth debvices)
* Airplay to a Samsung Series 8 TV
* Audio speakers builtin
* Microphone
* Sleep (although sometimes the wifi wont come back on it's own, must turn off wifi and turn back on)
* Maps

What is not working:
* Battery indicator (dont know how to make this work. Trying to patch the DSDT but not working out. Need help)
* booting stright from EFI patition on local drive. I use a USB key and make it priority during boot although this occupies the single USB A port on the laptop. Reffer to the post below for the Reddit post issue.

[Link to my Reddit post for the issue with EXITSB:START](https://www.reddit.com/r/hackintosh/comments/kvrnha/laptop_hp_spectre_x360_model_13acxxx_stuck_at/)
See the Reddit post, looks like this issue has a workaround in Clover. I haven't tried it myself. Will add the EFI for clover once I get it.
