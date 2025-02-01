
#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default

#rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}

# sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '2i src-git small https://github.com/soapmancn/small' feeds.conf.default
#sed -i '3i src-git nas https://github.com/linkease/nas-packages.git;master' feeds.conf.default
#sed -i '4i src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' feeds.conf.default

注释掉新版luci
sed -i 's|^#src-git luci https://github.com/coolsnowwolf/luci$|src-git luci https://github.com/coolsnowwolf/luci|' feeds.conf.default
sed -i 's|^src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-23.05$|#src-git luci https://github.com/coolsnowwolf/luci.git;openwrt-23.05|' feeds.conf.default
./scripts/feeds update -a && rm -rf feeds/luci/applications/luci-app-mosdns && rm -rf feeds/packages/net/{alist,adguardhome,mosdns,smartdns}
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang


mkdir package/small
pushd package/small

#克隆源码
git clone --depth=1 https://github.com/fw876/helloworld.git
#git clone https://github.com/kevinCSDN/lua-maxminddb.git  #git lua-maxminddb 依赖

#git clone https://github.com/kevinCSDN/luci-app-vssr-plus.git  

popd
