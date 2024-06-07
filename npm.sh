# 首先查看当前npm仓库的源
npm config get registry
# 永久切换官方的源
npm config set registry https://registry.npmjs.org/
# 永久切换成淘宝源
npm config set registry https://registry.npm.taobao.org

# 临时切换官方的源
npm --registry https://registry.npmjs.org/ install express
# 临时切换成淘宝源
npm --registry https://registry.npm.taobao.org install express
