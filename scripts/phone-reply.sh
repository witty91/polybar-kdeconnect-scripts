#!/bin/sh
#put your device id here. You can get it from 'kdeconnect-cli -l'
device=sjfdgjsdgjassd
#getting the number of the first notification
notification1=`dbus-send --session --print-reply --dest="org.kde.kdeconnect" /modules/kdeconnect/devices/$device org.kde.kdeconnect.device.notifications.activeNotifications|tr '\n' ' ' | awk '{print $12}'| sed s/\"//g`
#echo "$notification1"
#this actually opens up the same reply window the plasmoid on kde does
qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$device/notifications/$notification1 org.kde.kdeconnect.device.notifications.notification.reply
