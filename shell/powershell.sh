# 查看端口占用情况
netstat -ano
netstat -aon|findstr "2008"

# 查看指定 PID 的进程
tasklist|findstr "8912"
