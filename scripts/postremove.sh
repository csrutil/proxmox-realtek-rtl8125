#!/bin/sh

build_depmod() {
  for version in $(ls /lib/modules); do
    /usr/sbin/depmod -a $version
  done
}    

remove() {
  printf "\033[32m Remove modules.dep and map file for the driver \033[0m\n"
  build_depmod
}

purge() {
  printf "\033[32m Remove modules.dep and map file for the driver \033[0m\n"
  build_depmod
}

upgrade() {
  printf "\033[32m Remove modules.dep and map file for the driver \033[0m\n"
}

action="$1"

case "$action" in
"0" | "remove")
  remove
  ;;
"1" | "upgrade")
  upgrade
  ;;
"purge")
  purge
  ;;
*)
  remove
  ;;
esac
