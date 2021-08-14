#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.3.1/g' package/base-files/files/bin/config_generate
sed -i 's/root::0:0:99999:7:::/root:$1$l6Tqa73w$Zoavr1irum3walH.ZOQAo1:18674:0:99999:7:::/g' ./package/base-files/files/etc/shadow
# 去除 luci-app-socat与socat冲突文件
#sed -i '/INSTALL_CONF/d' feeds/packages/net/socat/Makefile
#sed -i '/socat\.init/d' feeds/packages/net/socat/Makefile

# Add luci-app-ssr-plus
pushd package/lean
git clone --depth=1 https://github.com/fw876/helloworld
svn co https://github.com/xiaorouji/openwrt-passwall/luci-app-passwall

# Add luci-app-onliner. (need luci-app-nlbwmon)
#git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-socat 
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-socat
#svn co https://github.com/xiaorouji/openwrt-passwall/trunk/luci-app-passwall
# Add luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon
#git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config


# Use immortalwrt's luci-app-netdata
#svn co https://github.com/immortalwrt/immortalwrt/trunk/package/ntlf9t/luci-app-netdata
popd
# Add netdata
#pushd feeds/packages/admin
#rm -rf netdata
#svn co https://github.com/immortalwrt/packages/trunk/admin/netdata
#popd
