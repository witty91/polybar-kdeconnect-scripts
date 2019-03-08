#!/bin/sh
device=42c3c7a3f203ade1
notification1=`dbus-send --session --print-reply --dest="org.kde.kdeconnect" /modules/kdeconnect/devices/$device org.kde.kdeconnect.device.notifications.activeNotifications|tr '\n' ' ' | awk '{print $12}'| sed s/\"//g`
replyable=`qdbus org.kde.kdeconnect /modules/kdeconnect/devices/42c3c7a3f203ade1/notifications/$notification1 org.kde.kdeconnect.device.notifications.notification.replyId`
if [ "$replyable" ]; then 
	qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$device/notifications/$notification1 org.kde.kdeconnect.device.notifications.notification.reply
fi
