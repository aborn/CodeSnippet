# docker 常用命令
# https://docs.docker.com/engine/reference/run/

# 创建用户自定义网桥
docker network create codepulse_net

# 将容器加入网桥
docker network connect codepulse_net codepulse_h5

# 查看自定义bridge网桥信息
docker network inspect b3e2fa1b291b

# 进入命令行界面
docker exec -it codepulse_h5 /bin/bash

# 镜像列表
docker image ls

# 删除镜像
docker image rm  61e8c95ada51

# 容器列表
docker container ls


# 删除容器
docker container rm
