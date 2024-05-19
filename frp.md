serverAddr = "x.x.x.x"
serverPort = 7000

[[proxies]]
name = "test_htts2http"
type = "https"
customDomains = ["test.yourdomain.com"]

[proxies.plugin]
type = "https2http"
localAddr = "127.0.0.1:80"

# HTTPS 证书相关的配置
crtPath = "./server.crt"
keyPath = "./server.key"
hostHeaderRewrite = "127.0.0.1"
requestHeaders.set.x-from-where = "frp"
