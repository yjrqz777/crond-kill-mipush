busyboxdir=$MODPATH/busybox
magiskbusybox=/data/adb/magisk/busybox
test -e "$magiskbusybox" && {
mkdir -p "$busyboxdir"
echo "－ 安装Magisk的busybox 中……"
$magiskbusybox --install -s $busyboxdir && echo "－ 完成！" || abort "－ 错误！"
} || abort "－ 您的magisk busybox 怎么不见了？"

CROND_FILE=$MODPATH/crond/setupcrond.sh
test -e $CROND_FILE && {
Magisk_mod=`grep 'MODDIRNAME=' /data/adb/magisk/util_functions.sh | head -n 1 |cut -d= -f2 | sed 's/_update.*//g;s/[[:space:]]//g' `
test -z $Magisk_mod && {
Magisk_mod=`grep 'MODULE_BASE=' /data/adb/magisk/util_functions.sh | head -n 1 |cut -d= -f2 | sed 's/_update.*//g;s/[[:space:]]//g'`
}
sed -i "1i MODPATH=\/data\/adb\/$Magisk_mod\/$id" $CROND_FILE
}