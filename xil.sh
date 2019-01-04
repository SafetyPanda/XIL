#!/bin/bash

# xil: xbps "translation layer": Utility that makes basic XBPS commands more sane
# Copyright (c) James Gillman [jronaldgillman@gmail.com], gitlab: @safetypanda
# See https://github.com/voidlinux for more info on Void Linux & XBPS

# Released under the GNU General Public License version 3+
# Refer to LICENSE file for license information.

version="1.0"

version() 
{
  echo "*----------------------------------------------------------*"
  echo "    xil Version $version"
  echo ""
  echo "    James Gillman [jronaldgillman@gmail.com]"
  echo "    License: GPLv3+" 
  echo "    XBPS version: $(xbps-query -v --version)"
  echo "*----------------------------------------------------------*"
  echo ""
}

usage()
{
  echo 
  version
  echo "Options: "
  echo "xtl [OPTIONS] [SUBCOMMANDS] [<ARGS>]"

  echo "update            -> Update Repos"
  echo "upgrade           -> Upgrade System"
  echo "listrepos         -> Lists all configured Repos"
  echo "addrepo <ARGS>    -> Adds a Repository"
  echo "search <NAME>     -> Searches for packages using a name"
  echo "install <PKG(s)>  -> Installs package(s)"
  echo "remove <PKG(s)>   -> Removes package(s)"
  echo "recursiveremove   -> Removes package(s) and it's dependencies"
  echo "autoremove        -> Removes orphaned packages"
  echo "help              -> Shows this dialog"
 echo ""
}

privCheck () 
{
  if [[ "$EUID" -gt 0 ]]; then
    echo "ERROR: This operation requires escalated privileges. Exiting!"
    exit 255
  fi
}

arg="$1"

case "$arg" in
  update)
    shift
    privCheck
    xbps-install -S
  ;;

  help)
    shift
    usage
  ;;

  upgrade)
    shift
    privCheck
    xbps-install -Suv
  ;;
  
  listrepos)
    shift
    xbps-query -v -L
  ;;

  addrepo)
    shift
    privCheck
    while [ "$#" -gt 0 ]; do
    xbps-install "$1"
    done
  ;;

  search)
    shift
    xbps-query -Rs "$@"
  ;;
    
  install)
    shift
    privCheck
    if [ "$#" -lt 1 ]; then
      msg "ERROR: argument missing, try --help."
      exit 1
    fi
    xbps-install -S "$@"
    ;;

  remove)
    shift
    privCheck
    if [ "$#" -lt 1 ]; then
      msg "ERROR: argument missing, try --help."
      exit 1
    fi
    xbps-remove "$@"
    ;;

  recursiveremove)
    shift
    privCheck
    if [ "$#" -lt 1 ]; then
      msg "ERROR: argument missing, try --help."
      exit 1
    fi
    xbps-remove -R "$@"
  ;;

  autoremove)
    shift
    privCheck
    xbps-remove -O
    ;;
esac

exit 0