author="`grep_prop author $TMPDIR/module.prop`"
name="`grep_prop name $TMPDIR/module.prop`"
description="`grep_prop description $TMPDIR/module.prop`"
id="`grep_prop id $TMPDIR/module.prop`"

function get_magisk_lite(){
local until_function=/data/adb/magisk/util_functions.sh
grep -q lite_modules $until_function && echo "－ 🌙当前为: Magisk Lite◎$MAGISK_VER_CODE" || echo "－ ☀当前为: Magisk Official◎$MAGISK_VER_CODE" 
}

function hello_master(){
if test -n "$(getprop persist.sys.device_name)" ;then
	echo ""
	echo "－ ●您好！"$(getprop persist.sys.device_name)"！●"
	echo "－ ●欢迎使用本模块！●"
	get_magisk_lite
	echo ""
elif test -n "$(pm list users | cut -d : -f2 )" ;then
	echo ""
	echo - ●您好！ $(pm list users | cut -d : -f2 )！●
	echo "－ ●欢迎使用本模块！●"
	get_magisk_lite
	echo ""
fi
}


echo ""
echo "∞————————————————————————∞"
hello_master
echo "－品牌: `getprop ro.product.brand`"
echo "－代号: `getprop ro.product.device`"
echo "－模型: `getprop ro.product.model`"
echo "－安卓版本: `getprop ro.build.version.release`"
test "`getprop ro.miui.ui.version.name`" != "" && echo "－MIUI版本: MIUI `getprop ro.miui.ui.version.name` - `getprop ro.build.version.incremental` "
echo "－内核版本: `uname -a `"
echo "－运存大小: `free -m|grep "Mem"|awk '{print $2}'`MB  已用:`free -m|grep "Mem"|awk '{print $3}'`MB  剩余:$((`free -m|grep "Mem"|awk '{print $2}'`-`free -m|grep "Mem"|awk '{print $3}'`))MB"
echo "－Swap大小: `free -m|grep "Swap"|awk '{print $2}'`MB  已用:`free -m|grep "Swap"|awk '{print $3}'`MB  剩余:`free -m|grep "Swap"|awk '{print $4}'`MB"
echo "∞————————————————————————∞"
echo ""
echo "∞————————————————————————∞"
echo "- 模块信息"
echo "- 名称: $name    "
echo "- 作者：$author"
echo "- $description    "
echo "∞————————————————————————∞"
echo ""

