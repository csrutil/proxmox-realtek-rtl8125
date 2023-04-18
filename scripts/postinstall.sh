#!/bin/sh

install() {
    printf "\033[32m Generate modules.dep and map file for the driver \033[0m\n"
    for version in $(ls /lib/modules); do
      /usr/sbin/depmod -a $version
    done
}

upgrade() {
    printf "\033[32m Generate modules.dep and map file for the driver \033[0m\n"
    for version in $(ls /lib/modules); do
      /usr/sbin/depmod -a $version
    done
}

action="$1"
if  [ "$1" = "configure" ] && [ -z "$2" ]; then
  # Alpine linux does not pass args, and deb passes $1=configure
  action="install"
elif [ "$1" = "configure" ] && [ -n "$2" ]; then
    # deb passes $1=configure $2=<current version>
    action="upgrade"
fi

case "$action" in
  "1" | "install")
    install
    ;;
  "2" | "upgrade")
    upgrade
    ;;
  *)
    # $1 == version being installed
    printf "\033[32m Not Support \033[0m"
    ;;
esac
