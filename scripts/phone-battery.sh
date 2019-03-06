#!/bin/sh
#put your device id here. You can get it from 'kdeconnect-cli -l'
device=sjfdgjsdgjassd
#sending a dbus command that returns the charge of the battery and a bunch of junk that is cleared before usage in polybar
charge=`dbus-send --session --print-reply --dest="org.kde.kdeconnect" /modules/kdeconnect/devices/42c3c7a3f203ade1 org.kde.kdeconnect.device.battery.charge|tr '\n' ' ' | awk '{print $10}'`
#echo the value and a percentage sign, which is what polybar displays
echo "$charge%"
