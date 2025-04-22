#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# Modify ttyd config
sed -i 's#/bin/login#/usr/libexec/login.sh#g' feeds/packages/utils/ttyd/files/ttyd.config

# Add default lan port
sed -i "/[ -d /sys/class/net/eth1 ] && ucidef_set_interface_wan 'eth1'/a\[ -d /sys/class/net/eth2 ] && ucidef_set_interface_lan 'eth0 eth2'" package/base-files/files/etc/board.d/99-default_network

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/ImmortalWrt/Bahamut-LZX/g' package/base-files/files/bin/config_generate

