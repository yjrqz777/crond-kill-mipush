SKIPMOUNT=false
key_source(){
if test -e "$1" ;then
source "$1"
rm -rf "$1"
fi
}
key_source $MODPATH/key.sh
key_source $MODPATH/busybox.sh
key_source $MODPATH/installapp.sh
set_perm_recursive  $MODPATH  0  0  0755  0644
test -d $MODPATH/busybox && set_perm_recursive $MODPATH/busybox 0 0 0755 0755

