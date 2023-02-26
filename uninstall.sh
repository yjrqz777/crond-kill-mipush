#!/sbin/sh
file="
/data/media/0/Android/kill-mipush.log
"

for i in $file ;do
test -e "$i" && rm -rf $i
done