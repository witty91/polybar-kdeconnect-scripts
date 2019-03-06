#!/bin/sh
#put your device id here. You can get it from 'kdeconnect-cli -l'
device=sjfdgjsdgjassd
#first dbus command gets the number of the first notification
notification1=`dbus-send --session --print-reply --dest="org.kde.kdeconnect" /modules/kdeconnect/devices/$device org.kde.kdeconnect.device.notifications.activeNotifications|tr '\n' ' ' | awk '{print $12}'| sed s/\"//g`
#echo "$notification1"

#if there is a notification (meaning $notification1 ist not empty) this command will get the content of said notification and else leave the polybar empty
if [ "$notification1" ]; then
	ticker1=`qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$device/notifications/$notification1 org.kde.kdeconnect.device.notifications.notification.ticker`
	echo "$ticker1"
else
	echo ""
fi
