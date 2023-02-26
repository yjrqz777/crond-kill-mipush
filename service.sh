#!/system/bin/sh
MODDIR=${0%/*}
BUSYBOXDIR=$MODDIR/busybox
export PATH=/system/bin:$BUSYBOXDIR:$PATH

test -e $MODDIR/crond && {
chmod -R 777 $MODDIR/crond
for i in $MODDIR/crond/*.sh ;do
	$i 2> /dev/null
done
}