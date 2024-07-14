#!/bin/bash
git clone --depth 1 https://github.com/bigbugcc/OpenwrtApp package/otherapp/OpenwrtApp
git clone --depth 1 https://github.com/destan19/OpenAppFilter package/otherapp/OpenAppFilter
git clone --depth 1 https://github.com/zzsj0928/luci-app-pushbot package/otherapp/luci-app-pushbot

# Theme
# luci-theme-neobird
git clone --depth 1 https://github.com/thinktip/luci-theme-neobird.git package/otherapp/luci-theme-neobird

# Mentohust
git clone --depth 1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk.git package/otherapp/mentohust

# UnblockNeteaseMusic
git clone --depth 1 -b master  https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/unblockneteasemusic

# OpenClash
git clone --depth 1 https://github.com/vernesong/OpenClash.git package/luci-app-openclash

# 在线更新
git clone --depth 1 https://github.com/wstanfeng/luci-app-gpsysupgrade package/luci-app-gpsysupgrade

# ddns-go
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go package/ddns-go

# aliyundrive-webdav
git clone --depth 1 -b main https://github.com/messense/aliyundrive-webdav package/aliyundrive-webdav

# nezha
git clone --depth 1 https://github.com/Erope/openwrt_nezha package/nezha

# Alist
git clone --depth=1 https://github.com/sbwml/luci-app-alist package/luci-app-alist

# 关机
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff

# 家长控制
git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter


rm -rf feeds/packages/multimedia/aliyundrive-webdav

# 修改主机信息
echo -n "$(date +"%Y%m%d")" > package/base-files/files/etc/openwrt_version

# TTYD 免登录
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# 更换6.6内核 
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=6.6/g' ./target/linux/x86/Makefile
