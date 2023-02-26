#!/system/bin/sh
export PATH=/system/bin:/data/adb/modules/dozewhitelist/busybox:$PATH

BUSYBOXDIR=$MODPATH/busybox
export PATH=/system/bin:$BUSYBOXDIR:$PATH


function limitlog(){
	local logfile=$1
	local maxsize=$((1024*10))
	filesize=`ls -l $logfile | awk '{ print $5 }'`
	if test "$filesize" -gt "$maxsize" ;then
		echo " " > $logfile
	fi
}

function Log() {
	txt="/data/media/0/Android/kill-mipush.log"
	echo -e "kill-push | $(date '+%y年%m月%d日%T') 电量: "$(dumpsys battery | awk '/level/{print $2}')" "$1" \n" >> $txt
	limitlog "$txt"
}


ps -A|grep com.xiaomi.xmsf|awk '{print $2}'|xargs kill -9

Log "kill"
