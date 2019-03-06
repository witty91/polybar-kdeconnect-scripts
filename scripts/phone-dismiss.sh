#!/bin/sh
#put your device id here. You can get it from 'kdeconnect-cli -l'
device=sjfdgjsdgjassd
#gets the number of the first notification
notification1=`dbus-send --session --print-reply --dest="org.kde.kdeconnect" /modules/kdeconnect/devices/$device org.kde.kdeconnect.device.notifications.activeNotifications|tr '\n' ' ' | awk '{print $12}'| sed s/\"//g`
#echo "$notification1"
#this dismisses the notification from the polybar AND from your phone
qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$device/notifications/$notification1 org.kde.kdeconnect.device.notifications.notification.dismiss
