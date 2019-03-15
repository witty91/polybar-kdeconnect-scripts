#!/bin/sh
#put your device id here. You can get it from 'kdeconnect-cli -l'
device=sjfdgjsdgjassd
#sending a dbus command that returns the charge of the battery and a bunch of junk that is cleared before usage in polybar
charge=`dbus-send --session --print-reply --dest="org.kde.kdeconnect" /modules/kdeconnect/devices/$device org.kde.kdeconnect.device.battery.charge|tr '\n' ' ' | awk '{print $10}'`
charging=`qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$device org.kde.kdeconnect.device.battery.isCharging`
#display either the percentage or the percentage plus a symbol to indicate charging
if [ $charging == "true" ]; then
	echo "$charge%"
else
	echo "$charge%"
fi

