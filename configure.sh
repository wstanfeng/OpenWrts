#!/bin/bash
# Modify default system settings

# 修改默认IP为192.168.10.1
# sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate 

# 修改主机信息
echo -n "$(date +"%Y%m%d")" > package/base-files/files/etc/openwrt_version

# TTYD 免登录
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# 更换6.6内核 
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=6.6/g' ./target/linux/x86/Makefile

# Hello World
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default

# luci-theme-infinityfreedom
echo 'src-git infinityfreedom https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom.git' >>feeds.conf.default

# passwall
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> feeds.conf.default
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> feeds.conf.default

# iStore
echo "src-git istore https://github.com/linkease/istore;main" >> feeds.conf.default

# 替换默认主题
rm -rf package/lean/luci-theme-argon 
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  package/lean/luci-theme-argon
