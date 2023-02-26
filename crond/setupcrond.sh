BUSYBOXDIR=$MODPATH/busybox
script_dir=${0%/*}
script_file=`find $script_dir -iname "*.sh" | sed "/${0##*/}/d"`

test -e $script_dir/root && {
crond -c $script_dir 
exit 1
}

test "$script_file" != "" && {
for i in $script_file ;do
#写入crontab时间
echo "*/15 * * * * $i" >>$script_dir/root
#设置脚本权限
chmod -R 0777 $script_dir
#添加Magisk自带的busybox
sed -i "2i export PATH=/system/bin:$BUSYBOXDIR:\$PATH" $i
#执行crond任务。
done
crond -c $script_dir
} || echo "description=不存在脚本文件！crond 启动失败！" >> $MODPATH/module.prop

